# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy the static HTML file into the Nginx server directory and rename it to index.html
# so Nginx serves it by default at the root URL.
COPY main.html /usr/share/nginx/html/index.html

# Ensure the file is readable
RUN chmod 644 /usr/share/nginx/html/index.html

# Copy our custom Nginx configuration to listen on 8080 and redirect all routes to our index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8080 mapped to Cloud Run
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
