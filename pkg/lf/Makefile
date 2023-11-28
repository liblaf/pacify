FILES += /etc/lf/colors
FILES += /etc/lf/icons
FILES += $(bindir)/lf
FILES += $(datadir)/fish/vendor_completions.d/lf.fish
FILES += $(datadir)/fish/vendor_functions.d/lfcd.fish

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

/etc/lf/colors: $(TMP_DIR)/colors
	$(INSTALL_DATA) $< $@

/etc/lf/icons: $(TMP_DIR)/colors
	$(INSTALL_DATA) $< $@

$(bindir)/lf: $(TMP_DIR)/lf
	$(INSTALL_PROGRAM) $< $@

$(datadir)/fish/vendor_completions.d/lf.fish: $(TMP_DIR)/lf.fish
	$(INSTALL_DATA) $< $@

$(datadir)/fish/vendor_functions.d/lfcd.fish: $(TMP_DIR)/lfcd.fish
	$(INSTALL_DATA) $< $@

###############
# Auxiliaries #
###############

$(TMP_DIR)/colors $(TMP_DIR)/icons:
	$(DOWNLOAD) https://github.com/gokcehan/lf/raw/master/etc/$(@F).example $@

$(TMP_DIR)/lf: $(TMP_DIR)/lf.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(@D) --verbose

$(TMP_DIR)/lf.fish $(TMP_DIR)/lfcd.fish:
	$(DOWNLOAD) https://github.com/gokcehan/lf/raw/master/etc/$(@F) $@

$(TMP_DIR)/lf.tar.gz:
	$(DOWNLOAD) https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz $@
