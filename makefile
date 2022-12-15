.PHONY: update-version release check-build all

VERSION := $(shell ./get_latest_release_version.sh)

all: check-build

release: update-version check-build

update-version:
	@echo Updating Dockerfile
	sed -E -i "s/frp_version=([0-9.-]+)/frp_version=$(VERSION)/" ./Dockerfile

check-build:
	@echo Validating Build
	docker build .\
		--tag=sethicis/frp-docker:latest \
		--tag=sethicis/frp-docker:$(VERSION) \
		--compress