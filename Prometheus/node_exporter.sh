#!bin/bash
sudo useradd \
    --system \
    --no-create-home \
    --shell /bin/false node_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz

tar -xvf node_exporter-1.6.1.linux-amd64.tar.gz

sudo mv \
  node_exporter-1.6.1.linux-amd64/node_exporter \
  /usr/local/bin/

rm -rf node_exporter*
node_exporter --version

#node_exporter.service
#sudo vim /etc/systemd/system/node_exporter.service [copy from Unit to multi user target and paste in this file]

[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target
StartLimitIntervalSec=500
StartLimitBurst=5
[Service]
User=node_exporter
Group=node_exporter
Type=simple
Restart=on-failure
RestartSec=5s
ExecStart=/usr/local/bin/node_exporter \
    --collector.logind
[Install]
WantedBy=multi-user.target

sudo systemctl enable node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter

#If you have any issues, check logs with journalctl
#journalctl -u node_exporter -f --no-pager

#More on https://mrcloudbook.com/netflix-clone-ci-cd-with-monitoring-email-devsecops/
