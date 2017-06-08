all: build

build:
	@docker build --tag=eswork/traefik .

release: build
	@docker build --tag=eswork/traefik:$(shell cat VERSION) .
