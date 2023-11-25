include make/*.mk

all:

install: $(bindir)/chezmoi
install: $(prefix)/share/fish/vendor_completions.d/chezmoi.fish

###############
# Auxiliaries #
###############

$(bindir)/chezmoi:
	@ mkdir --parents --verbose $(@D)
	wget --output-document=$@ $(GITHUB_URL)/twpayne/chezmoi/releases/latest/download/chezmoi-linux-amd64
	@ chmod u=rwx,go=rx --verbose $@

$(prefix)/share/fish/vendor_completions.d/chezmoi.fish: $(bindir)/chezmoi
	@ mkdir --parents --verbose $(@D)
	$< --output=$@ completion fish
