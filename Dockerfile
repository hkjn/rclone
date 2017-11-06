FROM hkjn/arch

ENV UNPRIVILEGED_UID=500

RUN pacman -Syyy && \
    pacman --noconfirm -S rclone && \
    useradd -m user \
            -u ${UNPRIVILEGED_UID} \
            -s /bin/bash 

COPY ["rclone_entrypoint", "/usr/local/bin/"]
ENTRYPOINT ["bash", "rclone_entrypoint"]
CMD [""]
