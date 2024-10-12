include dev.env


ifneq ($(shell docker compose version 2>/dev/null),)
	DC=docker compose
else ifneq ($(shell docker-compose --version 2>/dev/null),)
	DC=docker-compose
else
	$(error ************  docker compose or docker-compose not found. ************)
endif

up:
	@echo "Start React Project"
	$(DC) -f infra/docker-compose.yml up -d --build
down:
	@echo "Stop React Project"
	$(DC) -f infra/docker-compose.yml --remove-orphans


