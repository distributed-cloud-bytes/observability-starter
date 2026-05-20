# Operations

## Make targets

| Command | Action |
|---------|--------|
| `make up` | Start Prometheus and Grafana (`docker compose up -d`) |
| `make up-with-devops` | Start with `platform-dev` network overlay (requires network from devops-starter) |
| `make down` | Stop and remove containers for the default Compose project |
| `make ps` | Show container status |
| `make validate` | Validate default and platform-overlay Compose files |

## Logs and status

```bash
docker compose logs -f prometheus
docker compose logs -f grafana
make ps
```

## Applying configuration changes

After editing `prometheus/prometheus.yml` or files under `prometheus/rules/`:

```bash
docker compose restart prometheus
```

If lifecycle reload is enabled in your environment, you can POST to `/-/reload` instead. See [scrape-targets.md](scrape-targets.md).

After editing Grafana provisioning or dashboards, restart Grafana:

```bash
docker compose restart grafana
```

## Persistence

The sample Compose file mounts configuration and dashboards from the host. Prometheus TSDB and Grafana database are **container-local** unless you add named volumes for production-style persistence.

## Troubleshooting

| Symptom | Things to check |
|---------|------------------|
| Grafana shows no data | Datasource URL, Prometheus up, scrape targets reachable from the Prometheus container |
| Cannot scrape app on host | Use `host.docker.internal` (Docker Desktop) or host gateway IP; on Linux you may need `extra_hosts` |
| `up-with-devops` fails on network | Start [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter) first so `platform-dev` exists |
| Port already in use | Change `PROMETHEUS_PORT` / `GRAFANA_PORT` in `.env` |

For credential and exposure guidance, see [SECURITY.md](../SECURITY.md).
