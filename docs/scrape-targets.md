# Scrape targets

Default `prometheus/prometheus.yml` only scrapes Prometheus itself. Add your applications using `prometheus/prometheus.example.yml` as a guide.

## Spring Boot (Micrometer)

```yaml
- job_name: my-service
  metrics_path: /actuator/prometheus
  static_configs:
    - targets: ["host.docker.internal:8080"]
```

## Generic `/metrics` endpoint

```yaml
- job_name: my-service
  static_configs:
    - targets: ["host.docker.internal:9091"]
  metrics_path: /metrics
```

## With devops-starter (shared network)

1. Start [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter) (`make up`).
2. Start this repo with the platform network overlay:

   ```bash
   docker compose -f docker-compose.yml -f docker-compose.platform-network.yml up -d
   ```

3. Scrape Redpanda admin API:

   ```yaml
   - job_name: redpanda
     static_configs:
       - targets: ["dcb-redpanda:9644"]
   ```

4. Scrape your app container by **service name** on `platform-dev` instead of `host.docker.internal`.

## Apply config changes

After editing `prometheus.yml`:

```bash
docker compose restart prometheus
# or POST http://localhost:9090/-/reload if lifecycle enabled
```
