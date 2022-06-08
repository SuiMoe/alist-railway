FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"

ADD entrypoint.sh /entrypoint.sh
RUN chmod -R 777 /opt/alist/data && \
    chmod +x /entrypoint.sh && \
    wget "https://github.com/cokemine/ServerStatus-goclient/releases/latest/download/status-client_linux_${arch}.tar.gz" && \
    tar -zxvf "status-client_linux_${arch}.tar.gz" && \
    mv status-client /usr/local/bin/ && \
    rm -rf status-client*

EXPOSE 5244

ENV DB_TYPE=mysql
ENV CACHE_EXPIRATION=60
ENV CACHE_CLEANUP_INTERVAL=120

ENTRYPOINT ["sh", "/entrypoint.sh"]