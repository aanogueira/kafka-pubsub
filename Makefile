.PHONY: help build push build-producer push-producer build-consumer push-consumer

USERNAME=aanogueira
TAG=0.0.1

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## builds producer and consumer images
	@cd producer; docker build . -t $(USERNAME)/kafka-pubsub-producer:$(TAG)
	@cd consumer; docker build . -t $(USERNAME)/kafka-pubsub-consumer:$(TAG)

push: ## pushes producer and consumer images
	@cd producer; docker push $(USERNAME)/kafka-pubsub-producer:$(TAG)
	@cd consumer; docker push $(USERNAME)/kafka-pubsub-consumer:$(TAG)

build-producer: ## builds producer image
	@cd producer; docker build . -t $(USERNAME)/kafka-pubsub-producer:$(TAG)

push-producer: ## pushes producer image
	@cd producer; docker push $(USERNAME)/kafka-pubsub-producer:$(TAG)

build-consumer: ## builds consumer image
	@cd consumer; docker build . -t $(USERNAME)/kafka-pubsub-consumer:$(TAG)

push-consumer: ## pushes consumer image
	@cd consumer; docker push $(USERNAME)/kafka-pubsub-consumer:$(TAG)
