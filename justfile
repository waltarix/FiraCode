set dotenv-load

all: dep build

dep:
	docker build --pull \
		--build-arg GOSU_VERSION=$GOSU_VERSION \
		--build-arg IMAGE_TAG=$DOCKER_PYTHON_TAG \
		-t $DOCKER_TAG \
		./docker

build:
	docker run --rm \
		-v ${PWD}:/opt \
		-e DK_UID=$(id -u) \
		-e DK_GID=$(id -g) \
		${DOCKER_TAG} \
		./script/build.sh
