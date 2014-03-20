# Makefile for Vanilla Killed the Modded Sink

VERSION=1.4
TEMPCLNT := $(shell mktemp -u client-buildXXXX)
TEMPSERV := $(shell mktemp -u server-buildXXXX)

all: client-zip server-zip cleanbuild

client: 
	mkdir $(TEMPCLNT) && \
	cd $(TEMPCLNT) && \
	cp -r ../shared/* . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../client-pkgs/* . && \
	cp -r ../client-only/* . && \
	rm -r mods/disabled && \
	rm -r mods/bundledpackages 

server:
	mkdir $(TEMPSERV) && \
	cd $(TEMPSERV) && \
	cp -r ../shared/* . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../server-pkgs/* . && \
	cp -r ../server-only/* . && \
        rm -r mods/disabled && \
        rm -r mods/bundledpackages 

client-zip: client
	cd $(TEMPCLNT) && \
	zip -r ../client.zip *
	mv client.zip vanilla-killed-the-modded-sink-$(VERSION).zip

server-zip: server
	cd $(TEMPSERV) && \
	zip -r ../server.zip *
	mv server.zip sink-server-$(VERSION).zip

test: client
	rm test-client
	ln -s $(TEMPCLNT) test-client

clean: cleanbuild

cleanbuild:
	rm -rf client-build* server-build*

realclean: cleanbuild
	rm sink-server-$(VERSION).zip vanilla-killed-the-modded-sink-$(VERSION).zip
