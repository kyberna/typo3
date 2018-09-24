FROM martinhelmich/typo3:8
LABEL maintainer="Seti <sebastian.koehlmeier@kyberna.com>"

RUN apt update && apt install -y ghostscript && apt clean && rm -rf /var/lib/apt/lists/* /usr/src/*