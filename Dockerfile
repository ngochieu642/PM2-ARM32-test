FROM ngochieu642/pm2-node8-alpine-qemu

# Install app dependencies
RUN npm install && \
    pm2 install pm2-logrotate && \
    pm2 set pm2-logrotate:compress true && \
    pm2 set pm2-logrotate:dateFormat 'YYYY-MM-DD_HH_mm_ss'

COPY package.json .
COPY index.js .
COPY ecosystem.config.js .

CMD pm2-runtime start ecosystem.config.js