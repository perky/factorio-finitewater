#.SHELLFLAGS = -x -c

NAME := $(shell jsawk -i src/info.json 'return this.name')
VERSION := $(shell jsawk -i src/info.json 'return this.version')
DIR = $(NAME)_$(VERSION)
ZIP = $(NAME)_$(VERSION).zip

# the zip should be updated whenever any file in the src directory
# changes or is removed; find lists them all.
$(ZIP): src/info.json $(shell find src)
	mkdir "$(DIR)" && \
	cp -lR src/* "$(DIR)" && \
	zip -rv "$(ZIP)" "$(DIR)" --exclude @.gitignore && \
	rm -rf "$(DIR)"
