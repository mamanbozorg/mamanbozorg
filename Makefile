BIN_BREW  := $(which brew)
BIN_BOWER := $(which bower)
BIN_NPM   := $(which npm)

BIN_MAIN  := mamanbozorg.py

UNAME     := $(uname)

run: ${BIN_MAIN}
	@. extern/venv/bin/activate && python $<

install: prepare extern
	@. extern/venv/bin/activate && pip install flask

prepare:
	@mkdir -p extern
ifeq (${UNAME},Darwin)
ifeq (${BIN_NPM},)
	@brew install npm
endif
endif
ifeq (${UNAME},)
endif

ifeq (${BIN_BOWER},)
	@npm install -g bower
endif

extern: extern/venv extern/bower_components/bootstrap

extern/venv:
	@virtualenv $@

extern/bower_components/bootstrap: extern
	@cd extern && bower install bootstrap

extern/bootstrap: extern
	@cd extern && git clone -q https://github.com/twbs/bootstrap.git

purge:
	rm -rf extern

.PHONY: extern
