all: push

TAG=`cat TAG`
APP=strongswan
IMAGE=hub.digi-sky.com/base/${APP}:${TAG}
REMOTE_IMAGE=newops/${APP}:${TAG}

build:
	docker build -t ${IMAGE} .

push: build
	docker push ${IMAGE}

push2tx: build
	docker tag ${IMAGE} ${REMOTE_IMAGE}
	docker push ${REMOTE_IMAGE}

run:
	docker run -it -d --name ${APP} ${IMAGE} \
		--privileged \
		--net=host \
		-p 500:500 \
		-p 4500:4500 \

dev:
	docker run -it --rm --name ${APP} \
		--privileged \
		--net=host \
		-p 500:500 \
		-p 4500:4500 \
		-v `pwd`:/usr/src/app \
		${IMAGE} sh

conn:
	docker exec -it ${APP} sh

clean:
	docker stop ${APP}
	docker rm ${APP}

.PHONY: push
