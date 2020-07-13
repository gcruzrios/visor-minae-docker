FROM nginx:1.18-alpine

LABEL maintainer="TI GEOINN greivin.cruz@geoinn.com"

#ADD ./preconfigure.sh /preconfigure.sh

COPY html /usr/share/nginx/html

COPY dist /usr/share/nginx/html

#CMD ./preconfigure.sh
CMD nginx -g "daemon off;"

