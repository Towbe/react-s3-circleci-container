VERSION=2.2
TAG=towbe/react-s3-circleci

build:
	docker build . -t $(TAG) -t $(TAG):$(VERSION) -t $(TAG):latest

all: publish

publish: build
	docker push $(TAG):$(VERSION)
	docker push $(TAG):latest
