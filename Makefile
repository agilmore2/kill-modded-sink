
client: 
mkdir test-client
cd test-client
cp -r ../shared/config .

cp -r ../client-only/* .
cp -r ../shared-pkgs/mods .
cp -r ../client-pkgs/mods .
cp -r ../client-pkgs/bin .
cp -r ../client-pkgs/resourcepacks .
mkdir coremods

server:
mkdir test-server
cd test-server
cp -r ../shared/config .

cp -r ../shared-pkgs/mods .
cp -r ../shared-pkgs/plugins .
cp -r ../server-only/* .

