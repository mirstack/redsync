PROJECT=redsync
VERSION=0.0.1
MACHINE=unix-noarch

-include config.mk

all:
	@echo Nothing to do...

deps:
	$(PIP) install -r requirements.txt

install:
	install -d $(PREFIX)/bin
	install -m 0755 bin/* $(PREFIX)/bin/

install-man: install man
	install -d $(PREFIX)/man
	install -m 0644 man/*.1.roff $(PREFIX)/share/man/man1/

version:
	sed -i 's/^VERSION=.*$$/VERSION="$(VERSION)"/' bin/redpush
	sed -i 's/^version = .*$$/version = "$(VERSION)"/' bin/redpulld

pack: test version man
	mkdir -p tmp/bin tmp/share/man/man1 pkg
	cp bin/* tmp/bin/
	cp man/*.1 tmp/share/man/man1/
	cd tmp/ && $(ZIP) -r ../pkg/$(PROJECT)-$(VERSION)-$(MACHINE).zip bin share
	rm -r tmp

man:
ifdef RONN
	$(RONN) --manual="Mir's $(PROJECT) manual" --organization='Mir' man/*.ronn
else
	@echo Package providing 'ronn' is not installed. Skipping man page docs.
endif

test:
	$(BASH) ./test/test.sh

.PHONY: all deps install test version pack man
