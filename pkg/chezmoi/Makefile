FILES += $(bindir)/chezmoi
FILES += $(datadir)/fish/vendor_completions.d/chezmoi.fish

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

$(bindir)/chezmoi: $(TMP_DIR)/chezmoi
	$(INSTALL_PROGRAM) $< $@

$(datadir)/fish/vendor_completions.d/chezmoi.fish: $(TMP_DIR)/chezmoi.fish
	$(INSTALL_DATA) $< $@

###############
# Auxiliaries #
###############

$(TMP_DIR)/chezmoi:
	$(DOWNLOAD) https://github.com/twpayne/chezmoi/releases/latest/download/chezmoi-linux-amd64 $@
	@ chmod u=rwx,go=rx --verbose $@

$(TMP_DIR)/chezmoi.fish: $(TMP_DIR)/chezmoi
	$< --output=$@ completion fish
