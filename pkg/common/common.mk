ifndef NAME
$(error NAME is not set)
endif
ifndef PACIFY_ROOT
$(error PACIFY_ROOT is not set)
endif

prefix      := /usr/local
exec_prefix := $(prefix)
bindir      := $(exec_prefix)/bin
datarootdir := $(prefix)/share
datadir     := $(datarootdir)
mandir      := $(datarootdir)/man
man1dir     := $(mandir)/man1

TMP_DIR  := /tmp/pacify/$(NAME)

DOWNLOAD        := @ bash $(PACIFY_ROOT)/common/download.sh
RUN             :=
SUDO            := sudo
INSTALL         := @ $(SUDO) install -D --verbose
INSTALL_DATA    := $(INSTALL) --mode=u=rw,go=r
INSTALL_PROGRAM := $(INSTALL)
RM              := @ $(SUDO) rm --force --recursive --verbose
