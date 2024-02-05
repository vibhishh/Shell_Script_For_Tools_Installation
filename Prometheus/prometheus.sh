#!bin/bash
sudo useradd \
    --system \
    --no-create-home \
    --shell /bin/false prometheus
    
    
wget https://github.com/prometheus/prometheus/releases/download/v2.47.1/prometheus-2.47.1.linux-amd64.tar.gz

tar -xvf prometheus-2.47.1.linux-amd64.tar.gz

sudo mkdir -p /data /etc/prometheus

cd prometheus-2.47.1.linux-amd64/

sudo mv prometheus promtool /usr/local/bin/

sudo mv consoles/ console_libraries/ /etc/prometheus/

sudo mv prometheus.yml /etc/prometheus/prometheus.yml

sudo chown -R prometheus:prometheus /etc/prometheus/ /data/

#You can delete the archive and a Prometheus folder when you are done.
#cd
#rm -rf prometheus-2.47.1.linux-amd64.tar.gz

prometheus --version
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus

# Systemd unit configuration file.
#sudo vim /etc/systemd/system/prometheus.service

#Suppose you encounter any issues with Prometheus or are unable to start it. The easiest way to find the problem is to use the journalctl command and search for errors.
journalctl -u prometheus -f --no-pager

#More at https://mrcloudbook.com/netflix-clone-ci-cd-with-monitoring-email-devsecops/

#copy public ip with port no 9090 -- access to the chrome  DONE
