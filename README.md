# observability-starter

Generic **observability** starter from [Distributed Cloud Bytes](https://github.com/distributed-cloud-bytes): Prometheus + Grafana with provisioning, sample dashboard, and alert rules.

## Standalone or combined?

| Mode | What you do | Needs the other repo? |
|------|-------------|------------------------|
| **Standalone** | Clone this repo → `make up` → add scrape targets for **your** apps | **No** |
| **With devops-starter** | Start devops-starter first, then `make up-with-devops` | Optional — only if you want Kafka/Postgres locally |

Each repository is independent. Default Compose does not require [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter).

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

## Optional: run with devops-starter

1. In [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter): `make up` (creates network `platform-dev`)
2. In this repo: `make up-with-devops`
3. Follow [docs/integrate-devops-starter.md](docs/integrate-devops-starter.md)

Alerts: [docs/alerts.md](docs/alerts.md). Full walkthrough: [devops-starter — getting-started-full-stack](https://github.com/distributed-cloud-bytes/devops-starter/blob/main/docs/getting-started-full-stack.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[Apache License 2.0](LICENSE)
