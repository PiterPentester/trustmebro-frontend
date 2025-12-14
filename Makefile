.PHONY: help build run stop clean

IMAGE_NAME := trustmebro-frontend
IMAGE_TAG := latest
REGISTRY ?= docker.io
FULL_IMAGE_NAME := $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
PORT := 8080

help:
	@echo "Available targets:"
	@echo "  build    - Build Docker image"
	@echo "  push     - Push Docker image to registry"
	@echo "  run      - Run container on port $(PORT)"
	@echo "  stop     - Stop running container"
	@echo "  clean    - Remove image"
	@echo "  deploy   - Deploy to Kubernetes"
	@echo "  undeploy - remove from Kubernetes"

build:
	docker buildx build --platform linux/amd64,linux/arm64 -t $(IMAGE_NAME):$(IMAGE_TAG) .

push:
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) $(FULL_IMAGE_NAME)
	docker push $(FULL_IMAGE_NAME)

run:
	docker run -d -p $(PORT):80 --name $(IMAGE_NAME) $(IMAGE_NAME):$(IMAGE_TAG)

stop:
	docker stop $(IMAGE_NAME) || true
	docker rm $(IMAGE_NAME) || true

clean: stop
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true

deploy:
	kubectl apply -f k8s/frontend-deployment.yaml

undeploy:
	kubectl delete -f k8s/frontend-deployment.yaml
