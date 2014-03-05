# Makefile for Vanilla Killed the Modded Sink

VERSION=1.2
TEMPCLNT := $(shell mktemp -d client-buildXXXX)
TEMPSERV := $(shell mktemp -d server-buildXXXX)

client: 
	cd $(TEMPCLNT) && \
	cp -r ../shared/config . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../client-pkgs/* . && \
	cp -r ../client-only/* .

server:
	cd $(TEMPSERV) && \
	cp -r ../shared/config . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../server-pkgs/* . && \
	cp -r ../server-only/* .

client-zip: client
	cd $(TEMPCLNT) && \
	zip -r ../client.zip *
	mv client.zip vanilla-killed-the-modded-sink-$(VERSION).zip

server-zip: server
	cd $(TEMPSERV) && \
	zip -r ../server.zip *
	mv server.zip sink-server-$(VERSION).zip

clean:
	rm -rf client-build* server-build*
