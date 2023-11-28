VERSION != gh release --repo=lsd-rs/lsd list | grep Latest | cut --fields=1

FILES += $(bindir)/lsd
FILES += $(datadir)/fish/vendor_completions.d/lsd.fish
FILES += $(man1dir)/lsd.1

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

$(bindir)/lsd: $(TMP_DIR)/lsd
	$(INSTALL_PROGRAM) $< $@

$(datadir)/fish/vendor_completions.d/lsd.fish: $(TMP_DIR)/autocomplete/lsd.fish
	$(INSTALL_DATA) $< $@

$(datadir)/man/man1/lsd.1: $(TMP_DIR)/lsd.1
	$(INSTALL_DATA) $< $@

###############
# Auxiliaries #
###############

TAR_FILES += $(TMP_DIR)/lsd
TAR_FILES += $(TMP_DIR)/autocomplete/lsd.fish
TAR_FILES += $(TMP_DIR)/lsd.1
$(TAR_FILES) &: $(TMP_DIR)/lsd.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(TMP_DIR) --strip-components=1 --verbose

$(TMP_DIR)/lsd.tar.gz:
	$(DOWNLOAD) https://github.com/lsd-rs/lsd/releases/download/$(VERSION)/lsd-$(VERSION)-x86_64-unknown-linux-gnu.tar.gz $@
