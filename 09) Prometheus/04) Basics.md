## What is Prometheus?
- Prometheus is an open-source monitoring tool that collects metrics data, and provide tools to visualize the collected data.
- In addition, Prometheus allows you to generate `alerts` when metrics reach a user specified threshold.
- Prometheus collects metrics by scraping targets who expose metrics through an HTTP endpoint.
- Scraped metrics are then stored in a time series database which can be queried using Prometheus' built-in query language `PromQl`.
- Prometheus is primarily written in `GoLang`.
## What Kind of Metrics can Prometheus Monitor?
Prometheus is designed to monitor time-series data that is `numeric`.
- CPU/Memory utilization
- Disk space
- Service uptime
- Application specific data:
  - Number of exceptions
  - Latency
  - Pending requests
## What Type of Data Should NOT Prometheus Monitor?
- Events
- System logs
- Traces