VERSION != gh release --repo=natesales/q list | grep Latest
VERSION := $(firstword $(VERSION))
VERSION := $(VERSION:v%=%)

FILES += $(bindir)/q

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

$(bindir)/q: $(TMP_DIR)/q
	$(INSTALL_PROGRAM) $< $@

###############
# Auxiliaries #
###############

$(TMP_DIR)/q: $(TMP_DIR)/q.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(@D) --verbose

$(TMP_DIR)/q.tar.gz:
	$(DOWNLOAD) https://github.com/natesales/q/releases/download/v$(VERSION)/q_$(VERSION)_linux_amd64.tar.gz $@
