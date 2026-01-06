# Runtime stage with nginx
FROM nginx:alpine

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy built files to a template directory (to avoid hiding them if we mount a volume at /usr/share/nginx/html)
COPY index.html /usr/share/nginx/html-templates/index.html

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1

EXPOSE 80

# Install gettext for envsubst and run substitution on startup
# We output to /usr/share/nginx/html/index.html which should be a writable volume
CMD ["/bin/sh", "-c", "envsubst '$FRONTEND_VERSION' < /usr/share/nginx/html-templates/index.html > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]
