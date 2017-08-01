.PHONY: help
.DEFAULT_GOAL := help

export NAMESPACE?=appagile-devops


set-app:  ## set app	
	oc new-app -f ./app-template.yaml \
		-n ${NAMESPACE}

disable-route-one:  ## set app	
	oc patch service switcher-example  -p '{"spec":{"selector":{"name":"DISABLED"}}}'  \
		-n ${NAMESPACE}
	oc patch service switcher-example-2  -p '{"spec":{"selector":{"name":"switcher-example"}}}'  \
		-n ${NAMESPACE}
      
      
disable-route-two: ## set app
	oc patch service switcher-example-2  -p '{"spec":{"selector":{"name":"DISABLED"}}}'  \
		-n ${NAMESPACE}
	oc patch service switcher-example  -p '{"spec":{"selector":{"name":"switcher-example"}}}'  \
		-n ${NAMESPACE}

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo -e "Arguments/env variables: \n \
				"