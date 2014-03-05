
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

clean:
	rm -rf test-server test-client
