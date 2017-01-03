docker build -t mosuiqttoauthplugbuilder .

docker run -it -v `pwd`/bin:/export mosuiqttoauthplugbuilder cp -a /publish/. /export/.

ls -la bin/