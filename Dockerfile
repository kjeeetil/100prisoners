# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy the static HTML file into the Nginx server directory and rename it to index.html
COPY main.html /usr/share/nginx/html/index.html

# Copy our custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Fix permissions and ownership
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html && \
    chmod 644 /usr/share/nginx/html/index.html

# Debug: List files to verify existence
RUN ls -la /usr/share/nginx/html

# Expose port 8080 mapped to Cloud Run
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
