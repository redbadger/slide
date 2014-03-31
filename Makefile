
build: components index.ls slide.css
	node_modules/.bin/lsc -cb index.ls
	@component build --dev

components: component.json
	@component install --dev

clean:
	rm -fr build components

.PHONY: clean
