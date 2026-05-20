# Configuration

## Environment variables

Copy [`.env.example`](../.env.example) to `.env` in the repository root (same directory as `docker-compose.yml`).

| Variable | Default | Purpose |
|----------|---------|---------|
| `PROMETHEUS_PORT` | `9090` | Host port mapped to Prometheus UI and API |
| `GRAFANA_PORT` | `3000` | Host port mapped to Grafana |
| `GRAFANA_ADMIN_USER` | `admin` | Grafana admin username |
| `GRAFANA_ADMIN_PASSWORD` | `admin` | Grafana admin password |

## Compose files

| File | Purpose |
|------|---------|
| [`docker-compose.yml`](../docker-compose.yml) | Default stack: Prometheus + Grafana on `observability-default` |
| [`docker-compose.platform-network.yml`](../docker-compose.platform-network.yml) | Overlay: attach services to external network `platform-dev` for scraping alongside [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter) |

Start with the platform overlay:

```bash
make up-with-devops
# equivalent:
# docker compose -f docker-compose.yml -f docker-compose.platform-network.yml up -d
```

## Prometheus

| File | Purpose |
|------|---------|
| `prometheus/prometheus.yml` | **Active** config mounted into the container |
| `prometheus/prometheus.example.yml` | Example jobs; merge snippets into `prometheus.yml` as needed |
| `prometheus/rules/*.yml` | Rule files referenced from `prometheus.yml` |

Prometheus is started with `--web.enable-lifecycle` so you can reload configuration without restarting the container when your setup supports `/-/reload`. See [scrape-targets.md](scrape-targets.md) for reload notes.

## Grafana provisioning

Grafana loads:

- Datasources from `grafana/provisioning/datasources/`
- Dashboard providers from `grafana/provisioning/dashboards/`

Dashboard JSON lives under `grafana/dashboards/` and is read-only mounted into the container.
