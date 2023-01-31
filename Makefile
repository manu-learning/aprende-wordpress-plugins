DIR_WP:=wordpress

##@ Comandos
run: ##
	cd $(DIR_WP) && docker-compose up -d

stop: ##
	cd $(DIR_WP) && docker-compose down

down: ##
	cd $(DIR_WP) && docker-compose down --volumes

status: ##
	cd $(DIR_WP) && docker-compose ps

##@ Utilidades
h help: ## Mostrar menú de ayuda
	@awk 'BEGIN {FS = ":.*##"; printf "\nOpciones para usar:\n  make \033[36m\033[0m\n"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: h help run stop down status
