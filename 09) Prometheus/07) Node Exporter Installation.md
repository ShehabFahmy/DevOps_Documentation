## Normal Installation
1. Download node_exporter binary version `1.8.2` from `https://prometheus.io/download/`:
	```sh
	wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
	```
1. Unarchive the binary and start the node_exporter process using node_exporter binary:
	```sh
	tar xvf node_exporter-1.8.2.linux-amd64.tar.gz
	cd node_exporter-1.8.2.linux-amd64
	./node_exporter
	```
1. Check the metrics:
   ```sh
	curl localhost:9100/metrics
	```
---
## SystemD
1. Create a user for the node exporter:
   ```sh
   useradd --no-create-home --shell /bin/false node_exporter
	```
2. Move binary from the downloaded extracted package to `/usr/local/bin`:
   ```sh
   mv node_exporter /usr/local/bin/
	```
3. Change permissions to node_exporter user:
   ```sh
   chown node_exporter:node_exporter /usr/local/bin/node_exporter
	```
4. Create a service file for the node_exporter:
   ```sh
   vim /etc/systemd/system/node_exporter.service
	```
	Paste:
	```
	[Unit]
	Description=Node Exporter
	After=network.target
	
	[Service]
	User=node_exporter
	Group=node_exporter
	Type=simple
	ExecStart=/usr/local/bin/node_exporter
	
	[Install]
	WantedBy=multi-user.target
	```
5. Reload the system daemon:
   ```sh
   systemctl daemon-reload
	```
6. Start node_exporter service:
   ```sh
   systemctl start node_exporter
	```
7. Enable node exporter on system boot:
   ```sh
   systemctl enable node_exporter
	```
8. View the metrics browsing node exporter URL:
   ```sh
   curl localhost:9100/metrics
	```
9. Add configured node exporter Target On Prometheus Server:
   Login to Prometheus server and modify the prometheus.yml file:
   ```sh
   vim /etc/prometheus/prometheus.yml
	```
	Add the following configurations under the scrape config:
	```
	 - job_name: 'node_exporter'
	    scrape_interval: 5s
	    static_configs:
	      - targets: ['localhost:9100']
	```
10. Restart Prometheus service:
    ```sh
    systemctl restart prometheus
	```
11. Login to Prometheus server web interface, and check targets at `http://Prometheus-Server-IP:9090/targets`.