FROM nginx:1.27-alpine

# Copy entire custom NGINX tree
COPY nginx /etc/nginx
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Certs / keys mounted at run-time
ENTRYPOINT ["/docker-entrypoint.sh"]