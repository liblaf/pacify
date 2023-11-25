include make/*.mk

all:

install: $(bindir)/lf

###############
# Auxiliaries #
###############

$(bindir)/lf: $(TMP_DIR)/lf.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(TMP_DIR) --verbose
	@ chown --reference=$(@D) --verbose $@

$(TMP_DIR)/lf.tar.gz:
	@ mkdir --parents --verbose $(@D)
	wget --output-document=$@ https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz
