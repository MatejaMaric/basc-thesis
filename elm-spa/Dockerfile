FROM nginx:1.23-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /app
COPY index.html .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
