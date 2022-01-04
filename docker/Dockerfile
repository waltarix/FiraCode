FROM python:3.10.6-bullseye

WORKDIR /opt

COPY ./files/requirements.txt /tmp/

# hadolint ignore=DL3013
RUN set -uex; \
	pip install --no-cache-dir -U pip; \
	pip install --no-cache-dir -U -r /tmp/requirements.txt

ARG GOSU_VERSION=1.14
RUN set -uex; \
	curl -L \
		https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 \
		>/usr/local/bin/gosu; \
	chmod a+x /usr/local/bin/gosu;

COPY ./files/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
