# Integrate devops-starter

1. Start [devops-starter](https://github.com/distributed-cloud-bytes/devops-starter):

   ```bash
   make up
   ```

   This creates Docker network **`platform-dev`**.

2. Start observability with the network overlay:

   ```bash
   docker compose -f docker-compose.yml -f docker-compose.platform-network.yml up -d
   ```

3. Merge scrape jobs from `prometheus/prometheus.example.yml` into `prometheus/prometheus.yml`.

4. Open Grafana at http://localhost:3000

Full walkthrough: [devops-starter/docs/getting-started-full-stack.md](https://github.com/distributed-cloud-bytes/devops-starter/blob/main/docs/getting-started-full-stack.md)
