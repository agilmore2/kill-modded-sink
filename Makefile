# Makefile for Vanilla Killed the Modded Sink

VERSION=1.6
TEMPCLNT := $(shell mktemp -u client-buildXXXX)
TEMPSERV := $(shell mktemp -u server-buildXXXX)

all: client-zip server-zip cleanbuild

client: 
	mkdir $(TEMPCLNT) && \
	cd $(TEMPCLNT) && \
	cp -r ../shared/* . && \
	cp -r ../shared-pkgs/* . && \
	cp -r ../client-pkgs/* . && \
	cp -r ../client-only/* . && \
	zip -uj bin/modpack.jar version.json && \
	rm version.json MD5SUM && \
	cd mods && \
	rm -rf disabled && \
	unzip bundledpackages/Ruins_1.6.4.zip && \
	unzip bundledpackages/MAtmos_r26__1_6_4.zip && \
	rm -rf bundledpackages 
# add liteloader tweak and library entry to modpack.jar version.json

server:
	mkdir $(TEMPSERV) && \
	cd $(TEMPSERV) && \
	cp -r ../shared/* . && \
	cp -r ../shared-pkgs/* . && \
	cp -r ../server-pkgs/* . && \
	cp -r ../server-only/* . && \
	rm -rf mods/disabled && \
	cd mods && \
	unzip bundledpackages/Ruins_1.6.4.zip && \
	rm -rf bundledpackages && \
	cd ../plugins && \
	unzip bundledpackages/Flags.zip FlagsCore.jar Flags.jar

client-zip: client
	cd $(TEMPCLNT) && \
	zip -r ../$(TEMPCLNT).zip *
	mv $(TEMPCLNT).zip vanilla-killed-the-modded-sink-$(VERSION).zip

server-zip: server
	cd $(TEMPSERV) && \
	zip -r ../$(TEMPSERV).zip *
	mv $(TEMPSERV).zip sink-server-$(VERSION).zip

test: client
	rm -f test-client
	ln -s $(TEMPCLNT) test-client

clean: cleanbuild
	rm -f test-client

cleanbuild:
	rm -rf client-build* server-build*

realclean: cleanbuild
	rm sink-server-$(VERSION).zip vanilla-killed-the-modded-sink-$(VERSION).zip
