VERSION != https https://www.geekbench.com/download/linux/ | \
	grep cdn.geekbench.com | \
	grep --only-matching [[:digit:]].[[:digit:]].[[:digit:]] | \
	uniq

FILES += /opt/geekbench/geekbench_avx2
FILES += /opt/geekbench/geekbench_x86_64
FILES += /opt/geekbench/geekbench-workload.plar
FILES += /opt/geekbench/geekbench.plar
FILES += /opt/geekbench/geekbench6
FILES += $(bindir)/geekbench

all:

install: $(FILES)

uninstall:
	$(RM) $(FILES)

#########
# Files #
#########

/opt/geekbench/*: $(TMP_DIR)/Geekbench/*
	$(INSTALL) --mode=$(shell stat --format=%a $<) $< $@

$(bindir)/geekbench: /opt/geekbench/geekbench6
	@ $(SUDO) ln --force --symbolic --verbose $< $@

###############
# Auxiliaries #
###############

$(TMP_DIR)/Geekbench/%: $(TMP_DIR)/Geekbench-Linux.tar.gz
	@ mkdir --parents --verbose $(@D)
	tar --extract --file=$< --directory=$(@D) --strip-components=1 --verbose

$(TMP_DIR)/Geekbench-Linux.tar.gz:
	$(DOWNLOAD) https://cdn.geekbench.com/Geekbench-$(VERSION)-Linux.tar.gz $@
