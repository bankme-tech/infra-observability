# Observability Stack (GCP + Cloud Run + Hosts)

This stack provides Prometheus, Alertmanager, Grafana, Tempo (tracing), OpenTelemetry Collector, exporters (node, cadvisor, blackbox), and Zabbix. It also includes a Stackdriver exporter to scrape Cloud Monitoring (Cloud Run metrics) into Prometheus.

## Prereqs
- Docker + Docker Compose
- GCP Service Account with Monitoring Viewer role (and Project Viewer recommended). Download JSON key to `gcp-service-account/key.json` and set `GCP_PROJECT_ID` in `.env`.
- Open firewall to required ports (see below) or place behind a reverse proxy.

## Quick start
```bash
docker compose --env-file .env up -d
```

## Cloud Run traces
- Configure your Cloud Run apps to export OTLP traces to the public IP/DNS of this VM on port 4317 (gRPC) or 4318 (HTTP). Example OTLP endpoint: `otel-collector.your.domain:4317`.

## Ports
- Grafana: 3000
- Prometheus: 9090
- Alertmanager: 9093
- Tempo: 3200
- OTLP ingest (Collector): 4317/4318
- Stackdriver exporter: 9255
- Zabbix Web: 8080, Zabbix Server: 10051
- Node exporter: 9100 (host)

## GCP firewall hints
Allow ingress TCP: 3000, 9090, 9093, 3200, 4317, 4318, 9255, 8080, 10051. Restrict by source IPs as needed.

## Zabbix
- Default DB credentials in compose are insecure. Change for production.
- Install zabbix agents on target hosts or use SNMP/HTTP checks.

## Grafana login
- user: admin, password: admin

## Notes
- This stack is for demo/POC. Apply security hardening (authn, network, TLS) for production.
