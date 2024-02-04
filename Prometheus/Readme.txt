After the installation of Prometheus & NodeExporter, We need to add NodeExporter to the Prometheus file.

1- sudo vim /etc/prometheus/prometheus.yml #come to the end of the file and add

2- - job_name: node_export
     static_configs:
      - targets: ["localhost:9100"] #NodeExporter exposed on port no 9100

3- Restart the prometheus service.

4- check if the config is valid.
promtool check config /etc/prometheus/prometheus.yml

5- Reload the configs
curl -X POST http://localhost:9090/-/reload

6-Check the targets section
Go to Chrome > <http://<ip>:9090/targets>
We got a node export section and state UP
DONE...
