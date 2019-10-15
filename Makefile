prefix = $(HOME)
bindir = $(prefix)/bin
unitdir = $(HOME)/.config/systemd/user

UNITS = \
	tmpwatch.service \
	tmpwatch.timer

INSTALL = install

all:

install: activate

activate: install-units
	systemctl --user enable --now tmpwatch.timer

install-units: install-dirs
	for unit in $(UNITS); do \
		$(INSTALL) -m 644 $$unit $(unitdir); \
	done

install-dirs:
	install -d -m 755 $(unitdir)
