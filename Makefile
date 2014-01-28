BIN_BREW  := $(which brew)
BIN_BOWER := $(which bower)
BIN_NPM   := $(which npm)

BIN_MAIN  := mamanbozorg.py

UNAME     := $(uname)

.PHONY: default
default: sanity install run


.PHONY: run
run: ${BIN_MAIN}
	@. extern/venv/bin/activate && python $<


.PHONY: install
install: prepare
	@. extern/venv/bin/activate && pip install flask

.PHONY: sanity
sanity:
#ifeq (${BIN_NPM},)
#	@$(error "Missing Node Package Manager (npm)")
#endif
	@echo "Sanity check complete"


.PHONY: prepare
prepare: extern
	@mkdir -p extern
#ifeq (${BIN_BOWER},)
#	@npm install -g bower
#endif
	@echo "Preparation complete"


.PHONY: extern
extern: extern/venv

extern/venv:
	@virtualenv $@

extern/bower_components/bootstrap:
	@cd extern && bower install bootstrap

extern/bootstrap:
	@cd extern && git clone -q https://github.com/twbs/bootstrap.git


.PHONY: purge
purge:
	@rm -rf extern
