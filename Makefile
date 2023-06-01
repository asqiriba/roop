TAG := $(shell date +%Y%m%d)

# Runs the docker image to test locally
run:
	docker build . -t roop:${TAG}
	docker run -it --rm -e DISPLAY=host.docker.internal:0 --gpus all roop:${TAG}