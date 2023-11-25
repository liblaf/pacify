GITHUB_URL := https://github.com
prefix     := /usr/local
TMP_DIR    := /tmp/pacify

bindir := $(prefix)/bin

clean:
	@ rm --force --recursive --verbose $(TMP_DIR)
