# observability-starter

Generic **observability** starter from [Distributed Cloud Bytes](https://github.com/distributed-cloud-bytes): Prometheus + Grafana with provisioning, sample dashboard, and alert rules.

## Clone

```bash
git clone https://github.com/distributed-cloud-bytes/observability-starter.git
cd observability-starter
```

## Prerequisites

- Docker Desktop or Docker Engine with Compose v2

## Quick start

```bash
make up
# or: docker compose up -d
```

With [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter) on shared network `platform-dev`:

```bash
make up-with-devops
```

| UI | URL | Default login |
|----|-----|----------------|
| Grafana | http://localhost:3000 | `admin` / `admin` |
| Prometheus | http://localhost:9090 | — |

## Scrape your applications

Default `prometheus/prometheus.yml` scrapes Prometheus only. Copy jobs from **`prometheus/prometheus.example.yml`** into `prometheus/prometheus.yml`.

See **[docs/scrape-targets.md](docs/scrape-targets.md)** for Spring, generic `/metrics`, and Redpanda examples.

## Layout

```text
prometheus/           Prometheus config and alert rules
grafana/provisioning/ Datasources and dashboard provider
grafana/dashboards/   Sample golden-signals dashboard
docs/                 Integration with devops-starter
```

## Companion starter

Event-driven local stack: [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter)

See [docs/integrate-devops-starter.md](docs/integrate-devops-starter.md) and [docs/alerts.md](docs/alerts.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[Apache License 2.0](LICENSE)
