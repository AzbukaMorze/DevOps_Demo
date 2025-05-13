FROM nginx:stable

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ssl/cert.pem /etc/nginx/ssl/cert.pem
COPY ssl/key.pem /etc/nginx/ssl/key.pem

RUN mkdir -p /usr/share/nginx/html