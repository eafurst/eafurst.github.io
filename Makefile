WEB_MACH=tricycle.cs.washington.edu
WEB_PATH=/cse/web/homes/eafurst

all: clean build

build:
	jekyll build --config _config.yml

publish: clean build
	chmod -R a+r .
	chmod -R ug+w .
	rsync --exclude '.git' --recursive _site/ "$(WEB_MACH):$(WEB_PATH)"
	ssh $(WEB_MACH) "chmod -R a+r $(WEB_PATH)/*"
	ssh $(WEB_MACH) "chmod -R ug+w $(WEB_PATH)/*"

clean:

.PHONY: all publish clean build
