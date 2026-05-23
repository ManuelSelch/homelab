mkdir -p data/ssh

# nextcloud
ssh-keyscan -H 192.168.178.107 >> data/ssh/known_hosts 

# permissions
chmod 700 data/ssh
chmod 600 data/ssh/known_hosts 