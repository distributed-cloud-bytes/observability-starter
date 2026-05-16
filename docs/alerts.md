# Alerts

Example rules live in `prometheus/rules/http-golden-signals.yml`.

| Alert | Meaning |
|-------|---------|
| `HighHttp5xxRate` | More than 5% HTTP 5xx (Micrometer metric names) |
| `HighRequestLatency` | p99 latency above 2s |

## Customize

1. Copy the rules file and adjust thresholds for your SLOs.
2. Add Alertmanager in production (not included in local Compose by default).
3. Use metric names that match your framework — see [scrape-targets.md](scrape-targets.md).

If you do not run Spring/Micrometer, update or disable rules that reference `http_server_requests_seconds_*`.
