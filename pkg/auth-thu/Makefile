FILES += $(bindir)/auth-thu
FILES += $(datadir)/systemd/user/goauthing.service
FILES += $(datadir)/systemd/user/goauthing6.service

all:

install: $(FILES)
	$(RUN) systemctl --user daemon-reload

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

$(bindir)/auth-thu: $(TMP_DIR)/auth-thu
	$(INSTALL_PROGRAM) $< $@

$(datadir)/systemd/user/goauthing.service: goauthing.service
	$(INSTALL_DATA) $< $@

$(datadir)/systemd/user/goauthing6.service: goauthing6.service
	$(INSTALL_DATA) $< $@

###############
# Auxiliaries #
###############

$(TMP_DIR)/auth-thu:
	$(DOWNLOAD) https://mirrors.tuna.tsinghua.edu.cn/github-release/z4yx/GoAuthing/LatestRelease/auth-thu.linux.x86_64 $@
