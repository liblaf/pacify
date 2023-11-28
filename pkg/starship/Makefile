FILES += $(bindir)/starship
FILES += $(datadir)/fish/vendor_completions.d/starship.fish

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

$(bindir)/starship: $(TMP_DIR)/starship
	$(INSTALL_PROGRAM) $< $@

$(datadir)/fish/vendor_completions.d/starship.fish: $(TMP_DIR)/starship.fish
	$(INSTALL_DATA) $< $@

###############
# Auxiliaries #
###############

$(TMP_DIR)/starship: $(TMP_DIR)/starship.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(@D) --verbose

$(TMP_DIR)/starship.fish: $(TMP_DIR)/starship
	@ mkdir --parents --verbose $(@D)
	$< completions fish > $@

$(TMP_DIR)/starship.tar.gz:
	$(DOWNLOAD) https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz $@
