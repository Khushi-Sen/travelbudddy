# Use lightweight Linux distribution minimal size is 5 MB
# nginx is a high-performance web server.
FROM nginx: alpine

# Copy the Flutter web build output into Nginx's default HTML directory
COPY build/web /usr/share/nginx/html

# Expose port 80 to serve the web app
EXPOSE 80
