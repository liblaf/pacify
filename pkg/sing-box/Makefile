VERSION != gh release --repo=SagerNet/sing-box list | grep Latest
VERSION := $(firstword $(VERSION))

FILES += /usr/lib/systemd/system/sing-box.service
FILES += $(bindir)/sing-box
FILES += $(datadir)/fish/vendor_completions.d/sing-box.fish

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

/usr/lib/systemd/system/sing-box.service: sing-box.service
	$(INSTALL_DATA) $< $@

$(bindir)/sing-box: $(TMP_DIR)/sing-box
	$(INSTALL_PROGRAM) $< $@

$(datadir)/fish/vendor_completions.d/sing-box.fish: $(TMP_DIR)/sing-box.fish
	$(INSTALL_DATA) $< $@

###############
# Auxiliaries #
###############

$(TMP_DIR)/sing-box: $(TMP_DIR)/sing-box.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(@D) --strip-components=1 --verbose

$(TMP_DIR)/sing-box.fish: $(TMP_DIR)/sing-box
	@ mkdir --parents --verbose $(@D)
	$< completion fish > $@

$(TMP_DIR)/sing-box.tar.gz:
	$(DOWNLOAD) https://github.com/SagerNet/sing-box/releases/download/v$(VERSION)/sing-box-$(VERSION)-linux-amd64v3.tar.gz $@
