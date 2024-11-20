## Normal Installation
1. Download Prometheus binary version `2.40.1` from `https://prometheus.io/download/`:
    ```sh
    wget https://github.com/prometheus/prometheus/releases/download/v2.40.1/prometheus-2.40.1.linux-amd64.tar.gz
    ```
2. Unarchive the binary and start the Prometheus server process using Prometheus binary (http://localhost:9090):
    ```sh
    tar xvf prometheus-2.40.1.linux-amd64.tar.gz
    cd prometheus-2.40.1.linux-amd64
    ./prometheus
    ```
---
## SystemD
We want to start it like a service (`systemctl start prometheus`).
1. Create a new user for Prometheus that can't log in:
    ```sh
    useradd --no-create-home --shell /bin/false prometheus
    ```
2. Create needed directories:
    ```sh
    mkdir /etc/prometheus
    mkdir /var/lib/prometheus
    ```
3. Change the owner of the above directories:
    ```sh
    chown prometheus:prometheus /etc/prometheus
    chown prometheus:prometheus /var/lib/prometheus
    ```
4. Copy `prometheus` and `promtool` binary from the Prometheus package folder to `/usr/local/bin`:
    ```sh
    cp prometheus /usr/local/bin/
    cp promtool /usr/local/bin/
    ```
5. Change the ownership to Prometheus user:
    ```sh
    chown prometheus:prometheus /usr/local/bin/prometheus
    chown prometheus:prometheus /usr/local/bin/promtool
    ```
6. Copy `consoles` and `console_libraries` directories from the Prometheus package to `/etc/prometheus` folder:
    ```sh
    cp -r consoles /etc/prometheus
    cp -r console_libraries /etc/prometheus
    ```
7. Change the ownership to Prometheus user:
    ```sh
    chown -R prometheus:prometheus /etc/prometheus/consoles
    chown -R prometheus:prometheus /etc/prometheus/console_libraries
    ```
8. Copy the configuration file `prometheus.yaml` to the new folder and change its ownership:
    ```sh
    cp prometheus.yml /etc/prometheus/prometheus.yml
    chown prometheus:prometheus /etc/prometheus/prometheus.yml
    ```
9. Configure the Prometheus Service File:
    ```sh
    vi /etc/systemd/system/prometheus.service
    ```
    Paste:
	```yaml
	[Unit]
	Description=Prometheus
	Wants=network-online.target
	After=network-online.target
	
	[Service]
	User=prometheus
	Group=prometheus
	Type=simple
	ExecStart=/usr/local/bin/prometheus \
	--config.file /etc/prometheus/prometheus.yml \
	--storage.tsdb.path /var/lib/prometheus/ \
	--web.console.templates=/etc/prometheus/consoles \
	--web.console.libraries=/etc/prometheus/console_libraries
	
	[Install]
	WantedBy=multi-user.target
	```
10. Reload the systemd service:
    ```sh
    systemctl daemon-reload
    ```
11. Start the Prometheus service:
    ```sh
    systemctl start prometheus
    ```
12. Check service status:
    ```sh
    systemctl status prometheus
    ```
13. Start service on-boot:
    ```sh
    systemctl enable prometheus
    ```