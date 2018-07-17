PROJECT_DIR=$(shell pwd)
DOCKER_DIR=$(PROJECT_DIR)/deploy
NAME=
VERSION=0.0.1
REPO=

image:
	mkdir -p $(DOCKER_DIR)
	zip -r app.zip etc src/{{cookiecutter.app_name}} requirements.txt setup.py
	cp app.zip $(DOCKER_DIR)/app.zip && rm -f app.zip
	cp $(PROJECT_DIR)/Dockerfile $(DOCKER_DIR)/Dockerfile
	docker build -t $(NAME):$(VERSION) $(DOCKER_DIR)

Push:
	$(aws ecr get-login --no-include-email --region us-east-1 --profile PROFILE)
	docker tag $(NAME):$(VERSION) $(REPO):$(VERSION)
	docker push  $(REPO):$(VERSION)


clean:
	rm -rf $(DOCKER_DIR)
