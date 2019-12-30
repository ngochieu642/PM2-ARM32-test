FROM ngochieu642/pm2-arm32:latest

COPY package.json .
COPY index.js .
COPY ecosystem.config.js .

# Install app dependencies
RUN npm install && \
    pm2 install pm2-logrotate && \
    pm2 set pm2-logrotate:compress true && \
    pm2 set pm2-logrotate:dateFormat 'YYYY-MM-DD_HH_mm_ss'

CMD pm2-runtime start ecosystem.config.js