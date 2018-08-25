ELM_FILES=$(shell find src -name '*.elm' -type f)

.PHONY: all
all: test documentation.json

.PHONY: clean
clean:
	rm -rf elm-stuff tests/Doc documentation.json

elm-stuff:
	elm package install --yes

documentation.json: elm-stuff ${ELM_FILES}
	elm make --docs=$@

.PHONY: test
test: tests/Doc
	rm -rf elm-stuff/generated-code/elm-explorations/test/ && elm-test

tests/Doc: ${ELM_FILES}
	rm -rf elm-stuff/generated-code/elm-explorations/test/ && elm-verify-examples
