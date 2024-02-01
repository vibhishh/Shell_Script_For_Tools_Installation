sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker login #docker login is must because without logging in to the dockerhub account we can't do further scout installation process, it will give error

#Given commands below is for docker scout installtion
curl -fsSL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh -o install-scout.sh
sh install-scout.sh
docker scout --help #check the docker scout installed or not
