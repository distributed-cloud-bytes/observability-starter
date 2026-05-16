.PHONY: up up-with-devops down ps validate

up:
	docker compose up -d

up-with-devops:
	docker compose -f docker-compose.yml -f docker-compose.platform-network.yml up -d

down:
	docker compose down

ps:
	docker compose ps

validate:
	docker compose config >/dev/null
	docker compose -f docker-compose.yml -f docker-compose.platform-network.yml config >/dev/null
	@echo "Compose config OK"
