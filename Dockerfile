# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy the static HTML file into the Nginx server directory and rename it to index.html
# so Nginx serves it by default at the root URL.
COPY main.html /usr/share/nginx/html/index.html

# Expose port 80 (Cloud Run will automatically handle traffic routing)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
