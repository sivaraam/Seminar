SASS = $(shell which sass)
NPM = $(shell which npm)
NODE = $(shell which node || which nodejs)

ifeq "" "$(SASS)"
sass_fail:
	@echo "Please install Sass"
	@echo "Visit http://sass-lang.com/install for more details"
	@echo "On Ubuntu/Debian try: sudo apt-get install sass"
	exit 1
endif

ifneq "" "$(NODE_DIR)"
NPM = $(NODE_DIR)/bin/npm
NODE = $(NODE_DIR)/bin/node
else
ifeq "" "$(NPM)"
node_fail:
	@echo "Please install node.js"
	@echo "Visit https://nodejs.org/ for more details"
	@echo "On Ubuntu/Debian try: sudo apt-get install nodejs npm"
	exit 1
endif
endif

.PHONY: all watch

source_dir = "sass"
destination_dir = "css"
dir_param = "$(source_dir):$(destination_dir)"
import_dirs = "./node_modules"

all: node_modules
	$(SASS) --load-path $(import_dirs) --update $(dir_param)

node_modules:
	$(NPM) install

watch: all
	$(SASS) --load-path $(import_dirs) --watch $(dir_param)
