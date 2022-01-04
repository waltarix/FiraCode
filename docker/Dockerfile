ARG IMAGE_TAG
FROM python:${IMAGE_TAG}

ARG GOSU_VERSION
RUN set -uex; \
	curl -L \
		https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 \
		>/usr/local/bin/gosu; \
	chmod a+x /usr/local/bin/gosu;

WORKDIR /opt

COPY ./files/requirements.txt /tmp/

# hadolint ignore=DL3013
RUN set -uex; \
	pip install --no-cache-dir -U pip; \
	pip install --no-cache-dir -U -r /tmp/requirements.txt

COPY ./files/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
