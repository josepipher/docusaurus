FROM sanjose/centos7
MAINTAINER sanjose

RUN yum -y install curl epel-release
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum -y install nodejs gcc-c++ make \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /root/docusaurus; cd /root/docusaurus; npm install --global docusaurus-init; \
    docusaurus-init; \
    mv docs-examples-from-docusaurus docs; \
    cd website; mv blog-examples-from-docusaurus blog

EXPOSE 8000
WORKDIR /root/docusaurus/website

ENTRYPOINT ["/usr/bin/npm", "start", "-- --port 8000"]
