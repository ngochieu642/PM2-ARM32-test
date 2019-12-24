FROM ngochieu642/pm2-node8-alpine

# Install app dependencies
RUN npm install
RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:compress true
RUN pm2 set pm2-logrotate:dateFormat 'YYYY-MM-DD_HH_mm_ss'

COPY package.json .
COPY index.js .
COPY ecosystem.config.js .

CMD ["pm2 start ecosystem.config.js"]