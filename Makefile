
client: 
	mkdir test-client
	cd test-client && \
	cp -r ../shared/config . && \
	cp -r ../client-only/* . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../client-pkgs/* . && \
	mkdir coremods

server:
	mkdir test-server
	cd test-server && \
	cp -r ../shared/config . && \
	cp -r ../shared-pkgs/mods . && \
	cp -r ../server-only/* . && \
	cp -r ../server-pkgs/* .

clean:
	rm -rf test-server test-client
