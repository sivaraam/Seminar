NPM = $(shell which npm)
NODE = $(shell which node || which nodejs)

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

JAVA_SOURCES='java_resources/'
CLASS_DEST='WEB-INF/classes'
SERVLET_API='/opt/apache-tomcat-8.5.15/lib/servlet-api.jar'

.PHONY: all watch

all: node_modules java-resources
	$(NPM) run build

node_modules: package.json
	$(NPM) install

watch: all
	$(NPM) run watch:sass

java-resources:
	mkdir -p $(CLASS_DEST)
	javac -d WEB-INF/classes -classpath /opt/apache-tomcat-8.5.15/lib/servlet-api.jar java_resources/*/*
