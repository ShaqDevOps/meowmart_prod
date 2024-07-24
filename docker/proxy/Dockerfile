FROM nginx:1.23.0-alpine

COPY ./nginx/* /etc/nginx/
COPY ./run.sh /run.sh

ENV APP_HOST=app
ENV APP_PORT=9000

USER root

RUN apk add --no-cache bash
RUN chmod +x /run.sh

VOLUME /vol/static
VOLUME /vol/media

CMD ["/run.sh"]
