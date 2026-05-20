# Architecture

This starter runs a **single Compose project** with two long-lived services: Prometheus scrapes targets you configure; Grafana reads Prometheus as a datasource and loads dashboards from the repo.

## Components

| Component | Role |
|-----------|------|
| **Prometheus** | Scrapes metrics from configured jobs, evaluates recording/alert rules under `prometheus/rules/` |
| **Grafana** | UI, dashboards from `grafana/dashboards/`, datasources and dashboard providers from `grafana/provisioning/` |

## Data flow

1. Your applications (or Redpanda) expose a metrics HTTP endpoint.
2. Prometheus scrapes on the configured interval and stores time series in its local TSDB (container-local by default in this template).
3. Grafana queries Prometheus using the provisioned datasource.

## Repository layout

| Path | Purpose |
|------|---------|
| `prometheus/prometheus.yml` | Active scrape configuration (starts with self-scrape only) |
| `prometheus/prometheus.example.yml` | Copy/paste jobs for apps and Redpanda |
| `prometheus/rules/` | Alert (and optional recording) rules |
| `grafana/provisioning/` | Datasource and dashboard provider YAML |
| `grafana/dashboards/` | Dashboard JSON (sample golden-signals dashboard) |

## Networks

| Mode | Network | When to use |
|------|---------|-------------|
| **Default** | `observability-default` | Standalone local run; scrape apps on the host via `host.docker.internal` where supported |
| **With devops-starter** | External `platform-dev` | Use `docker-compose.platform-network.yml` overlay so Prometheus can scrape containers by service name on the platform stack |

See [integrate-devops-starter.md](integrate-devops-starter.md) and the full walkthrough in [devops-starter/docs/getting-started-full-stack.md](https://github.com/distributed-cloud-bytes/devops-starter/blob/main/docs/getting-started-full-stack.md).

## Extending the template

Add scrape jobs in `prometheus/prometheus.yml`, tune or fork rules under `prometheus/rules/`, and add dashboards under `grafana/dashboards/` with matching provisioning in `grafana/provisioning/dashboards/`. Keep changes generic so the starter stays reusable across teams.
