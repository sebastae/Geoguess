FROM node:lts-alpine

COPY . .

RUN ["npm", "i"]
RUN ["npm", "run", "build"]

FROM caddy:2-alpine

COPY --from=0 dist/ /srv/
COPY Caddyfile /etc/caddy/Caddyfile