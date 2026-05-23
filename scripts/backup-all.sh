#!/bin/bash
set -uo pipefail

LOG_FILE="logs/backup-all-$(date +%Y%m%d-%H%M%S).log"
FAILED=0
TOTAL=0

# Log to file and stdout
mkdir -p logs
exec > >(tee -a "$LOG_FILE") 2>&1

echo "======================================================"
echo "Backup started: $(date)"
echo "======================================================"

while IFS= read -r script; do
    TOTAL=$((TOTAL + 1))
    module_dir="$(dirname "$(dirname "$script")")"
    module=$(basename "$module_dir")

    echo ""
    echo "[$TOTAL] Module: $module"
    echo "    Script: $script"

    if (cd "$module_dir" && bash "$script"); then
        echo "    ✓ SUCCESS"
    else
        rc=$?
        echo "    ✗ FAILED (exit code: $rc)"
        FAILED=$((FAILED + 1))
    fi
done < <(find /srv -maxdepth 4 -type f -path "*/scripts/backup.sh" | sort)

echo ""
echo "======================================================"
echo "Finished: $(date)"
echo "Total: $TOTAL | Success: $((TOTAL - FAILED)) | Failed: $FAILED"
echo "Log: $LOG_FILE"
echo "======================================================"

exit $FAILED
