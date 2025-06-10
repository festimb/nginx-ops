# NGINX Ops project

A production ready, modular architecture based, container-first Nginx configuration that turns any directory into a **secure reverse-proxy and load-balancer**.

---

## What it does

* Load balances / splits traffic across any number of back-end services (`round robin`)
* Provides reverse proxy capabilities
* Adds modern security headers & sane DoS protections
* Terminates TLS 1.2/1.3, and forces HTTPS
* Supports web socket communication via protocol upgrade
* JSON access logs ready for ELK / Loki

---



## How it works

* `docker-entrypoint.sh` renders that one `*.template` with `envsubst`, so you inject `SITE_FQDN`, `SITE_CERT`, `SITE_KEY` at run-time.  
* All other files are copied and parsed automatically by NGINX.

---



## Prerequisites

* **Docker** 20.10+  
* **docker-compose** v2  
* PEM-encoded certificate and key inside `certs/` & `keys/`. You can use openssl tool to generate the certificate.
* Replace server URLs in upstream.conf with your desired hosts. You can use **python3 -m http.server <port>** to start base servers.

---

## Quick start

```bash
git clone https://github.com/festimb/nginx-ops.git
cd nginx-ops

Run project
docker compose up -d --build


