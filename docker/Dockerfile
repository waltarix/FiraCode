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

ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_NO_CACHE_DIR=1

# hadolint ignore=DL3013
RUN set -uex; \
	pip install -U pip; \
	pip install -U -r /tmp/requirements.txt

COPY ./files/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
