# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy the static HTML file into the Nginx server directory and rename it to index.html
# so Nginx serves it by default at the root URL.
COPY main.html /usr/share/nginx/html/index.html

# Copy a custom Nginx configuration to listen on 8080 and redirect all routes to our index.html
RUN rm /etc/nginx/conf.d/default.conf && \
    printf 'server {\n    listen 8080;\n    location / {\n        root /usr/share/nginx/html;\n        index index.html;\n        try_files $uri $uri/ /index.html;\n    }\n}\n' > /etc/nginx/conf.d/default.conf

# Expose port 8080 mapped to Cloud Run
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
