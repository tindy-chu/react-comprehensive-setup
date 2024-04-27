# builder
FROM node:21-bullseye AS builder
WORKDIR /usr/src/app
COPY . .

RUN yarn
RUN yarn build

# run
FROM nginx:1.25.5-alpine
RUN rm -rf /etc/nginx/conf.d/*
COPY --from=builder /usr/src/app/config/nginx.conf /etc/nginx/conf.d

WORKDIR /var/www/html
COPY --from=builder /usr/src/app/dist ./
COPY --from=builder /usr/src/app/.env /usr/src/app/scripts/env.sh ./
RUN cp index.html 404.html
RUN chmod +x /var/www/html/env.sh

EXPOSE 80

CMD ["sh", "-c", ". /var/www/html/env.sh && nginx -g 'daemon off;'"]

# docker build --no-cache -t react-comprehensive-setup . && docker run -p 3000:80 -e HELLO=testing react-comprehensive-setup
# docker exec -it $(docker ps | grep "react-comprehensive-setup" | cut -c1-4) sh
