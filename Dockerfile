FROM node:alpine

RUN yarn global add \
    vuepress \
    @vuepress/plugin-pwa \
    @vuepress/plugin-back-to-top

RUN mkdir -p /vuepress/docs /vuepress/html

COPY generate.sh /generate.sh
RUN chmod +x /generate.sh
#EXPOSE 8080
ENTRYPOINT ["sh", "/generate.sh"]