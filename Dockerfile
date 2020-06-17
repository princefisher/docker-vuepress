FROM node:alpine

RUN yarn global add \
    vuepress \
    @vuepress/plugin-pwa \
    @vuepress/plugin-back-to-top

RUN mkdir -p /vuepress/docs /vuepress/html

COPY build.sh /build.sh
RUN chmod +x /build.sh
ENTRYPOINT ["sh", "/build.sh"]