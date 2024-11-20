```
-------
| VM1 | <--
-------   |
          | ................ Prometheus ..................
-------   | .-----------     ----------      ----------- .
| VM2 | <-| .| Scrapes |     | Stores |      | Accepts | .
-------   |--| Metric  | --> | Metric | <--> | PromQL  | . <--> USER
          | .| Data    |     | Data   |      | Query   | .
-------   | .-----------     ----------      ----------- .
| VM3 | <-- . Retrieval         TSDB         HTTP Server .
-------     ..............................................
```
## Collecting Metrics
- Prometheus collects metrics by sending `http` requests to `/metrics` endpoint of each target.
- Prometheus can be configured to use a different path other than `/metrics`.
## Exporters
- Most systems by default don’t collect metrics and expose them on an HTTP endpoint to be consumed by a Prometheus server.
- Exporters collect metrics and expose them in a format Prometheus expects.
- Prometheus has several native exporters:
  - Node exporters (Linux servers)
  - Windows
  - MySQL
  - Apache
  - HAProxy
## Client Libraries
- Prometheus comes with client libraries that allow you to expose any application metrics you need Prometheus to track.
- Language support:
  - Go
  - Java
  - Python
  - Ruby
  - Rust
---
## Push vs Pull
### Pull-based Model
- Prometheus follows a pull-based model.
- Prometheus needs to have a list of all targets it should scrape.
- Other Pull-based monitoring solutions include:
  - Zabix
  - nagios
#### Why Pull?
- Some of the benefits of using a pull-based system:
  - Easier to tell if a target is `down`.
  - Push based systems could potentially `overload` metrics server if too many incoming connections get flooded at same time.
  - Pull based systems have a definitive list of targets to monitor, creating a `central source of truth`.
### Push-based Model
- In a pushed-based model, the targets are configured to push the metric data to the metrics server.
- Push-based systems include:
  - Logstash
  - Graphite
  - OpenTSDB
#### Why Push?
- Push based monitoring excels in the following areas:
  - Event-based systems, pulling data wouldn’t be a viable option, however, Prometheus is for collecting metrics and not monitoring events.
  - Short lived jobs, as they may end before a pull can occur. Prometheus has a feature called `Pushgateway` to handle this situation.