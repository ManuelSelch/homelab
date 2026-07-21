# upload to storagebox
rsync -a --progress --delete -e "ssh -p 23" \
	data/media/ \
	u592320@u592320.your-storagebox.de:/home/music/
