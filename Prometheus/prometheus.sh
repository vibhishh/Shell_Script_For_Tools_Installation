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

#sudo vim /etc/systemd/system/prometheus.service [copy all upto multi-user.target and paste to prometheus.service file]

#[Unit]
#Description=Prometheus
#Wants=network-online.target
#After=network-online.target
#StartLimitIntervalSec=500
#StartLimitBurst=5
#[Service]
#User=prometheus
#Group=prometheus
#Type=simple
#Restart=on-failure
#RestartSec=5s
#ExecStart=/usr/local/bin/prometheus \
# --config.file=/etc/prometheus/prometheus.yml \
#  --storage.tsdb.path=/data \
#  --web.console.templates=/etc/prometheus/consoles \
#  --web.console.libraries=/etc/prometheus/console_libraries \
#  --web.listen-address=0.0.0.0:9090 \
#  --web.enable-lifecycle
#[Install]
#WantedBy=multi-user.target

sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus


#Suppose you encounter any issues with Prometheus or are unable to start it. The easiest way to find the problem is to use the journalctl command and search for errors.
journalctl -u prometheus -f --no-pager

# Systemd unit configuration file.
#sudo vim /etc/systemd/system/prometheus.service

#More at https://mrcloudbook.com/netflix-clone-ci-cd-with-monitoring-email-devsecops/

#copy public ip with port no 9090 -- access to the chrome  DONE
