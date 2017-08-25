source_dir = "sass"
destination_dir = "css"
dir_param = "$(source_dir):$(destination_dir)"

import_dirs = "./node_modules"

ifeq "" "$(shell which sass)"
default:
	@echo "Please install Sass"
	@echo "Visit http://sass-lang.com/install for more details"
	@echo "On Ubuntu/Debian try: sudo apt-get install sass"
	exit 1
else
SASS = $(shell which sass)
default: build
endif


build:
	$(SASS) --load-path $(import_dirs) --update $(dir_param)

watch:
	$(SASS) --load-path $(import_dirs) --watch $(dir_param)
