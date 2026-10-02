# Start from a small, ready-made image that already contains the nginx web server
FROM nginx:alpine

# Copy our web page into the folder where nginx looks for pages to serve
COPY index.html /usr/share/nginx/html/index.html

# Document that the container listens on port 80 (the standard web port)
EXPOSE 80