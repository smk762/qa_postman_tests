FROM komodoofficial/komodo:cd_release_41265fb_master
LABEL maintainer="smk@komodoplatform.com"

# Setup up user and working directory
ARG GROUP_ID
ARG USER_ID
ARG SERVICE_CLI
RUN addgroup --gid ${GROUP_ID} notarygroup
RUN adduser --disabled-password --gecos '' --uid ${USER_ID} --gid ${GROUP_ID} komodian
WORKDIR /home/komodian

RUN cp /komodo/komodo-cli /usr/local/bin/komodo-cli && \
    cp /komodo/komodod /usr/local/bin/komodod && \
    PATH=/usr/local/bin/:$PATH

COPY entrypoint.sh /entrypoint.sh
COPY run.sh /run.sh

# Setup user and working directory
RUN chown -R komodian:notarygroup /home/komodian
USER komodian

ENTRYPOINT ["/entrypoint.sh"]

# Start daemon with the data directory mounted
