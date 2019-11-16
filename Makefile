.PHONY: tasks

CMD=

tasks:
	@echo Usage: make [task]
	@echo -------------------
	@echo
	@cat Makefile

# e.g. $ make docker_up OPT='--build'
docker_up:
	docker-compose up $(OPT)

docker_bash:
	docker-compose run sam_ruby_template bash
