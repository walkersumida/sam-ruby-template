.PHONY: tasks

CMD=

tasks:
	@echo Usage: make [task]
	@echo -------------------
	@echo
	@cat Makefile

run_funcs:
	cd sam-app && sam local invoke HelloWorldFunction --event events/event.json

run_tests:
	docker-compose run sam_ruby_template /bin/sh -c "cd sam-app && ruby tests/unit/test_handler.rb"

# e.g. $ make docker_up OPT='--build'
docker_up:
	docker-compose up $(OPT)

docker_bash:
	docker-compose run sam_ruby_template bash
