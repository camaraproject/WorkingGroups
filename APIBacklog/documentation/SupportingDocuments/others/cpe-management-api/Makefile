PLANTUML_TARGETS := $(addsuffix .png, $(basename $(wildcard *.puml)))

.PHONY: all
all: plantuml

.PHONY: clean
clean:
	rm -rf *.png '?'

.PHONY: plantuml
plantuml: $(PLANTUML_TARGETS)

$(PLANTUML_TARGETS): %.png: %.puml
	docker run --rm -it --user "$$(id -u):$$(id -g)" \
		--volume "$$PWD:/data:Z"  \
		plantuml/plantuml:latest /data/$<
