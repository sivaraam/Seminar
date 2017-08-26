source_dir = "sass"
destination_dir = "css"
dir_param = "$(source_dir):$(destination_dir)"

import_dirs = "./node_modules"

# Default build target
build:

sass:
ifeq "" "$(shell which sass)"
default:
	@echo "Please install Sass"
	@echo "Visit http://sass-lang.com/install for more details"
	@echo "On Ubuntu/Debian try: sudo apt-get install sass"
	exit 1
else
SASS = $(shell which sass)
endif

node:
ifneq "" "$(NODE_DIR)"
NPM = $(NODE_DIR)/bin/npm
NODE = $(NODE_DIR)/bin/node
else
ifeq "" "$(shell which npm)"
default:
	@echo "Please install node.js"
	@echo "Visit https://nodejs.org/ for more details"
	@echo "On Ubuntu/Debian try: sudo apt-get install nodejs npm"
	exit 1
else
NPM = $(shell which npm)
NODE = $(shell which node || which nodejs)
endif
endif

node_modules: node
	$(NPM) install

build: sass
	$(SASS) --load-path $(import_dirs) --update $(dir_param)

watch: build sass
	$(SASS) --load-path $(import_dirs) --watch $(dir_param)
