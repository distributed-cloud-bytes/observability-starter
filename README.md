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
docker compose up -d
```

| UI | URL | Default login |
|----|-----|----------------|
| Grafana | http://localhost:3000 | `admin` / `admin` |
| Prometheus | http://localhost:9090 | — |

## Scrape your applications

Edit `prometheus/prometheus.yml` and add a `scrape_configs` job for your service.

Spring Boot (Micrometer) example:

```yaml
- job_name: my-service
  metrics_path: /actuator/prometheus
  static_configs:
    - targets: ["host.docker.internal:8080"]
```

## Layout

```text
prometheus/           Prometheus config and alert rules
grafana/provisioning/ Datasources and dashboard provider
grafana/dashboards/   Sample golden-signals dashboard
docs/                 Integration with devops-starter
```

## Companion starter

Event-driven local stack: [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter)

See [docs/integrate-devops-starter.md](docs/integrate-devops-starter.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[Apache License 2.0](LICENSE)
