VERSION=latest

docker-build:
	docker build -t ironhack-data:${VERSION} .

docker-run:
	docker --rm --publish 8888:8888 ironhack-data:${VERSION}

docker-tag:
	docker tag ironhack-data:${VERSION} javierluna/ironhack-data:${VERSION}

docker-push: docker-build docker-tag
	docker push javierluna/ironhack-data
