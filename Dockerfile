# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy the static HTML file into the Nginx server directory and rename it to index.html
# so Nginx serves it by default at the root URL.
COPY main.html /usr/share/nginx/html/index.html

# Expose port (Cloud Run sets the PORT environment variable, defaults to 8080)
EXPOSE 8080

# Update the Nginx config to listen on $PORT instead of 80, then start Nginx
CMD sh -c "sed -i 's/listen  *80;/listen '${PORT:-8080}';/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
