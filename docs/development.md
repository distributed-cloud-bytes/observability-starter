# Development

## Validate before a pull request

```bash
make validate
```

This runs `docker compose config` for the default project and for the platform-network overlay.

## Continuous integration

The repository includes [`.github/workflows/ci-validate.yml`](../.github/workflows/ci-validate.yml), which validates Compose files on pushes and pull requests.

## Changing dashboards and rules

- Prefer **generic** dashboard variables and panel titles; avoid product-specific naming.
- Keep alert rules aligned with metrics you document in [scrape-targets.md](scrape-targets.md). If you change metric names, update [alerts.md](alerts.md) accordingly.

## Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md) and the [pull request template](../.github/pull_request_template.md). For dashboard changes, include screenshots or short test notes in the PR description.
