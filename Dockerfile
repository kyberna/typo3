FROM martinhelmich/typo3:8
LABEL maintainer="Seti <sebastian.koehlmeier@kyberna.com>"

RUN apt update && apt install -y ghostscript ssh && apt clean && rm -rf /var/lib/apt/lists/* /usr/src/*
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config && \
    sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

ADD docker-typo3-entrypoint /usr/local/bin/
ENTRYPOINT ["docker-typo3-entrypoint"]