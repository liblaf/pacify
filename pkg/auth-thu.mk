include make/*.mk

all:

install: $(bindir)/auth-thu

###############
# Auxiliaries #
###############

$(bindir)/auth-thu:
	@ mkdir --parents --verbose $(@D)
	wget --output-document=$@ https://mirrors.tuna.tsinghua.edu.cn/github-release/z4yx/GoAuthing/LatestRelease/auth-thu.linux.x86_64
	@ chmod u=rwx,go=rx --verbose $@
