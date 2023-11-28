export PACIFY_ROOT := $(CURDIR)
export NAME

all:

install:
ifndef NAME
	$(error NAME is not set)
endif
	$(MAKE) --directory=$(NAME) install MAKEFILES=$(PACIFY_ROOT)/common/common.mk NAME=$(NAME)

uninstall:
ifndef NAME
	$(error NAME is not set)
endif
	$(MAKE) --directory=$(NAME) uninstall MAKEFILES=$(PACIFY_ROOT)/common/common.mk NAME=$(NAME)

clean:
	@ rm --force --recursive --verbose /tmp/pacify
