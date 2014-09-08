# /dev/null/make

# Disable built-in implicit rules.
.SUFFIXES:

# What to install to bindir.
BINSRCS  = $(wildcard *.exp)

# Init path variables.
PREFIX  ?= /usr/local
BINDIR  := $(PREFIX)/bin
BINTGTS  = $(addprefix $(BINDIR)/,$(basename $(BINSRCS)))

# Init commands.
INSTALL  = install -vp
RM       = rm -vf

# By default, show help.
.DEFAULT_GOAL	:=	help

# HELP
.PHONY:		help usage
help:
	@echo "USAGE:"
	@echo "    make install"
	@echo "    make uninstall"
usage:	help

# Generate install targets.
BIN_template = $(BINDIR)/$(basename $(1)): $(1); @$(INSTALL) $(1) $(BINDIR)/$(basename $(1))
$(foreach BINSRC,$(BINSRCS),$(eval $(call BIN_template,$(BINSRC))))

# Install / Uninstall
install:	$(BINTGTS)

uninstall:
	@$(RM) $(BINTGTS)
