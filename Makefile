ELM_FILES=$(shell find src -name '*.elm' -type f)

.PHONY: all
all: test documentation.json

.PHONY: clean
clean:
	rm -rf elm-stuff tests/elm-stuff tests/Doc documentation.json

elm-stuff:
	elm package install --yes

documentation.json: elm-stuff ${ELM_FILES}
	elm make --yes --warn --docs=$@

.PHONY: test
test: tests/Doc tests/elm-stuff
	elm test

tests/Doc: ${ELM_FILES}
	elm-verify-examples

tests/elm-stuff: tests/elm-package.json
	cd tests && elm package install --yes
