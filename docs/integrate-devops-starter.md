# Integrate devops-starter

1. Clone [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter)
2. Start the dev stack: `cd environments/dev/compose && docker compose up -d`
3. Start this observability stack: `docker compose up -d`
4. Add scrape jobs in `prometheus/prometheus.yml` for services publishing metrics on the host

Published ports from devops-starter (defaults):

| Service | Host port |
|---------|-----------|
| Kafka API | 19092 |
| Schema Registry | 18081 |
| Postgres | 5433 |
