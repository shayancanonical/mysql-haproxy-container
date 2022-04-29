FROM ubuntu:20.04

RUN useradd -Mr haproxy

RUN apt-get update -y \
	&& apt-get install -y haproxy mysql-client \
	&& apt-get clean -y

RUN chown -R haproxy /etc/haproxy

EXPOSE 3307
EXPOSE 3308

USER haproxy

COPY --chown=haproxy haproxy/check_mysql.sh /usr/local/bin/check_mysql.sh
COPY --chown=haproxy haproxy-configs /configs

COPY --chown=haproxy entrypoint.sh /

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
