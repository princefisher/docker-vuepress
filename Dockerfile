FROM node:alpine

RUN yarn global add \
    vuepress \
    @vuepress/plugin-pwa \
    @vuepress/plugin-back-to-top

RUN mkdir -p /vuepress/docs /vuepress/html

COPY scripts/build.sh /build.sh
COPY scripts/dev.sh /dev.sh
RUN chmod +x /build.sh && chmod +x /dev.sh
ENTRYPOINT ["sh"]