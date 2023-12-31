FROM debian:bookworm-20231030-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y rtl-sdr && \
    apt-get --purge autoremove -y && \
    apt-get clean && \
    find /var/lib/apt/lists/ -type f -delete && \
    rm -rf /usr/share/doc

STOPSIGNAL SIGTERM

ENTRYPOINT ["/usr/bin/rtl_tcp"]
