# Start from a specific Nginx + Alpine version
FROM nginx:1.31-alpine3.20

RUN apk update && apk upgrade --no-cache

# Copy our web page into Nginx's web directory
COPY index.html /usr/share/nginx/html/index.html

# Document that Nginx listens on port 80
EXPOSE 80