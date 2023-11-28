VERSION != gh release --repo=charmbracelet/vhs list | grep Latest
VERSION := $(firstword $(VERSION))
VERSION := $(VERSION:v%=%)

FILES += $(bindir)/vhs
FILES += $(datadir)/fish/vendor_completions.d/vhs.fish
FILES += $(man1dir)/vhs.1.gz

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

$(bindir)/vhs: $(TMP_DIR)/vhs
	$(INSTALL_PROGRAM) $< $@

$(datadir)/fish/vendor_completions.d/vhs.fish: $(TMP_DIR)/completions/vhs.fish
	$(INSTALL_DATA) $< $@

$(man1dir)/vhs.1.gz: $(TMP_DIR)/manpages/vhs.1.gz
	$(INSTALL_DATA) $< $@

###############
# Auxiliaries #
###############

TAR_FILES += $(TMP_DIR)/completions/vhs.fish
TAR_FILES += $(TMP_DIR)/manpages/vhs.1.gz
TAR_FILES += $(TMP_DIR)/vhs
$(TAR_FILES) &: $(TMP_DIR)/vhs.tar.gz
	@ mkdir --parents --verbose $(TMP_DIR)
	tar --extract --file=$< --directory=$(TMP_DIR) --verbose

$(TMP_DIR)/vhs.tar.gz:
	$(DOWNLOAD) https://github.com/charmbracelet/vhs/releases/download/v$(VERSION)/vhs_$(VERSION)_Linux_x86_64.tar.gz $@
