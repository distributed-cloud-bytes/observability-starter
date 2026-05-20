# observability-starter

[![View on KikPlate](https://img.shields.io/static/v1?label=KikPlate&message=observability-starter&color=0366d6&style=flat-square)](https://kikplate.dev/plates/observability-starter)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

[![Documented](https://img.shields.io/badge/Documented-yes-0366d6?style=flat-square)](docs/README.md)
[![Docker Ready](https://img.shields.io/badge/Docker%20Ready-yes-0366d6?style=flat-square)](docs/operations.md)
[![Well Tested](https://img.shields.io/badge/Well%20Tested-CI-green?style=flat-square)](.github/workflows/ci-validate.yml)
[![Cloud Native](https://img.shields.io/badge/Cloud%20Native-yes-0366d6?style=flat-square)](docs/architecture.md)
[![Beginner Friendly](https://img.shields.io/badge/Beginner%20Friendly-yes-0366d6?style=flat-square)](docs/README.md)
[![Production Ready](https://img.shields.io/badge/Production%20Ready-local%20dev-orange?style=flat-square)](docs/operations.md)
[![Security Friendly](https://img.shields.io/badge/Security%20Friendly-SECURITY.md-blue?style=flat-square)](SECURITY.md)

Generic **observability** starter from [Distributed Cloud Bytes](https://github.com/distributed-cloud-bytes): Prometheus + Grafana with provisioning, sample dashboard, and alert rules.

## Overview

| Topic | Description |
|-------|-------------|
| **Standalone use** | Clone this repo, run `make up`, and add scrape targets for your applications. No other repository required. |
| **Combined with devops-starter** | Start [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter) first, then `make up-with-devops` to attach to Docker network `platform-dev`. |
| **Prometheus** | Scrapes configured jobs and evaluates alert rules under `prometheus/rules/`. |
| **Grafana** | Pre-provisioned datasource, dashboard provider, and a sample golden-signals dashboard. |
| **Scrape targets** | Default config self-scrapes only; merge jobs from `prometheus/prometheus.example.yml` into `prometheus/prometheus.yml`. |
| **Alerts** | Example HTTP golden-signals rules; tune thresholds and metric names for your stack. |

---

## Quick Start

The fastest way to run the stack locally is with Docker Compose.

```sh
git clone https://github.com/distributed-cloud-bytes/observability-starter.git
cd observability-starter

make up
# or: docker compose up -d
```

| UI | URL | Default login |
|----|-----|---------------|
| Grafana | http://localhost:3000 | `admin` / `admin` |
| Prometheus | http://localhost:9090 | — |

Copy scrape jobs from `prometheus/prometheus.example.yml` into `prometheus/prometheus.yml`. See [Scrape targets](docs/scrape-targets.md) for Spring Boot, generic `/metrics`, and Redpanda examples.

**Prerequisites:** Docker Desktop or Docker Engine with Compose v2.

Install the CLI to scaffold this plate from a terminal.

## Install CLI

### macOS/Linux via Homebrew tap

```sh
brew tap kikplate/homebrew-kikplate
brew install kikplate
```

### Windows via Scoop

```powershell
scoop bucket add kikplate https://github.com/kikplate/scoop-bucket.git
scoop install kikplate
```

### Manual install from release archives (all platforms)

```sh
# Linux/macOS
tar -xzf kikplate-<version>-linux-amd64.tar.gz
sudo install kikplate-<version>-linux-amd64 /usr/local/bin/kikplate

# macOS example
tar -xzf kikplate-<version>-darwin-arm64.tar.gz
sudo install kikplate-<version>-darwin-arm64 /usr/local/bin/kikplate
```

```powershell
# Windows (PowerShell)
Expand-Archive .\kikplate-<version>-windows-amd64.zip -DestinationPath .
Move-Item .\kikplate-<version>-windows-amd64.exe kikplate.exe
# Add the folder containing kikplate.exe to PATH
```

### Build from source

```sh
go install github.com/kikplate/kikplate/cli@latest
```

Quick sanity check:

```sh
kikplate --help
kikplate config init
kikplate login
kikplate search --category devops
kikplate scaffold distributed-cloud-bytes/observability-starter my-observability
```

---

## Documentation

| Document | Description |
|----------|-------------|
| [Architecture](docs/architecture.md) | Components, networks, provisioning, and metrics flow into Grafana |
| [Configuration](docs/configuration.md) | Environment variables, Compose files, and Prometheus entrypoints |
| [Scrape targets](docs/scrape-targets.md) | Spring Boot, generic `/metrics`, Redpanda, applying config changes |
| [Alerts](docs/alerts.md) | Example rules, thresholds, and framework-specific metrics |
| [Operations](docs/operations.md) | Make targets, logs, restarts, validation, and troubleshooting |
| [Development](docs/development.md) | CI checks, dashboards and rules, and contribution workflow |
| [Integrate devops-starter](docs/integrate-devops-starter.md) | Run on shared Docker network `platform-dev` with the Kafka stack |
| [Full stack walkthrough](https://github.com/distributed-cloud-bytes/devops-starter/blob/main/docs/getting-started-full-stack.md) | Order of operations for devops-starter plus observability-starter |
| [Contributing](CONTRIBUTING.md) | Fork, branch, PR expectations, and doc maintenance |
| [Kikplate badges](docs/BADGES.md) | Badge slugs and how to request Official on Kikplate |

---

## Repository Layout

```
prometheus/           Prometheus config and alert rules
grafana/provisioning/ Datasources and dashboard provider
grafana/dashboards/   Sample golden-signals dashboard
docs/                 Documentation
.github/              CI workflows
```

---

## License

[LICENSE](LICENSE)
