include make/*.mk

VERSION != gh release --repo=lsd-rs/lsd list | grep Latest | cut --fields=1

all:

install: $(bindir)/lsd
install: $(prefix)/share/fish/vendor_completions.d/lsd.fish
install: $(prefix)/share/man/man1/lsd.1

###############
# Auxiliaries #
###############

$(bindir)/lsd: $(TMP_DIR)/lsd
	@ install -D --no-target-directory --verbose $< $@

$(prefix)/share/fish/vendor_completions.d/lsd.fish: $(TMP_DIR)/autocomplete/lsd.fish
	@ install -D --no-target-directory --verbose $< $@

$(prefix)/share/man/man1/lsd.1: $(TMP_DIR)/lsd.1
	@ install -D --no-target-directory --verbose $< $@

FILES += $(TMP_DIR)/autocomplete/lsd.fish
FILES += $(TMP_DIR)/lsd
FILES += $(TMP_DIR)/lsd.1

$(FILES) &: $(TMP_DIR)/lsd.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(TMP_DIR) --strip-components=1 --verbose

$(TMP_DIR)/lsd.tar.gz:
	@ mkdir --parents --verbose $(@D)
	wget --output-document=$@ https://github.com/lsd-rs/lsd/releases/download/$(VERSION)/lsd-$(VERSION)-x86_64-unknown-linux-gnu.tar.gz
