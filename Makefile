VERSION=1.2

client: 
	mkdir test-client
	cd test-client && \
	cp -r ../shared/config . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../client-pkgs/* . && \
	cp -r ../client-only/* .

server:
	mkdir test-server
	cd test-server && \
	cp -r ../shared/config . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../server-pkgs/* . && \
	cp -r ../server-only/* .

client-zip: client
	cd test-client && \
	zip -r ../client.zip *
	mv client.zip vanilla-killed-the-modded-sink-$(VERSION).zip

server-zip: server
	cd test-server && \
	zip -r ../server.zip *
	mv server.zip sink-server-$(VERSION).zip

clean:
	rm -rf test-server test-client
