FROM balenalib/armv7hf-alpine:3.15-run 

WORKDIR /usr/src/app

# hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates docker

# fail if binaries are missing or won't run
RUN dockerd --version && docker --version

# install entrypoint script
COPY entry.sh ./

RUN chmod +x entry.sh 
	
CMD [ "/usr/src/app/entry.sh" ]