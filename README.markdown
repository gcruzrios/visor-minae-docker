
# docker-nginx-leaflet **CENIGA MINAE**

###Español

Es un contenedor en Docker de un pequeño web sitio con Leaflet que puede ser apuntado a cualquier servidor Tile Server. Este ejemplo en particular carga varias capas de un Servidor de mapas de Costa Rica fue desarrollado para Centro Nacional de Información Ambiental [CENIGA](http://www.ceniga.go.cr) del Ministerio de Ambiente y Energía [MINAE](https://www.minae.go.cr)

El ejemplo de este proyecto se conecta a un Tile server (geoserver) que está ubicado en la plataforma de CENIGA en AWS.
A container to host a small Leaflet website that can be customized to point to any compatible tile server.

###English

It is a container in Docker of a small web site with Leaflet that can be pointed to any Tile Server. This particular example loads several layers of a Costa Rica Map Server was developed for the National Center for Environmental Information [CENIGA] (http://www.ceniga.go.cr) of the Ministry of Environment and Energy [MINAE] (https : //www.minae.go.cr)

The example in this project connects to a Tile server (geoserver) that is located on the CENIGA platform on AWS.
A container to host a small Leaflet website that can be customized to point to any compatible tile server.

## Why / Porque existe ?


This image is for quickly setting up a web front-end to preview changes to a tile server, who could also be running in [Docker](https://www.docker.com/).

Esta imagen es para instalar rapidamente un web front para visualizar cambios previos a un tile server y puede ejecutarse en [Docker](https://www.docker.com/)

## Build Instructions / Instrucciones Build


Se puede descargar la imagen desde mi Github repository:

    $ sudo docker build -t gcruzrios/visor-minae-docker https://github.com/gcruzrios/visor-minae-docker.git

O hacer una descarga del código y crear la imagen con un docker build basado en el archivo Dockerfile.

    $ docker build -t nginx/leaflet .


You can download the image from my Github repository:

     $ sudo docker build -t gcruzrios / visor-minae-docker https://github.com/gcruzrios/visor-minae-docker.git

Or download the code and create the image with a docker build based on the Dockerfile file.

     $ docker build -t nginx / leaflet.

## Running / correr el container

Se puede correr el container sin variables de Entorno para correr una instancia de Leaflet que apunta a los servidores de [OpenStreetMap](https://www.openstreetmap.org/)

    $ sudo docker run -it -p 8080:80 visor-minae-docker/nginx-leaflet

You can run the container with no ENV options to run an instance of Leaflet that points to the primary [OpenStreetMap](https://www.openstreetmap.org/) servers.

    $ sudo docker run -it -p 8080:80 visor-minae-docker/nginx-leaflet

----------------------------------------------------------------------------------------

Se tiene que chequear el puerto 8080 que despliegue que muestra un mapa Leaflet, con las capas de OSM si se quiere personalizar y correr un mapa MapQuest OSM:

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://otile1.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg" -e "ATTRIBUTION=Tiles Courtesy of <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a> <img src=\"http://developer.mapquest.com/content/osm/mq_logo.png\">" openfirmware/nginx-leaflet


Checking your Docker host port 8080 should display a Leaflet map, with OSM tiles. If you want to customize the tiles and run MapQuest OSM:

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://otile1.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg" -e "ATTRIBUTION=Tiles Courtesy of <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a> <img src=\"http://developer.mapquest.com/content/osm/mq_logo.png\">" openfirmware/nginx-leaflet


El URL template de servidor de Mapas está documentado en el siguiente link [Leaflet API](http://leafletjs.com/reference.html#url-template). Esto debe lanzar un contenedor de docker que despliega un map  Leaflet usando capas del servidor de MapQuest.


The Tile Server URL template is documented in the [Leaflet API](http://leafletjs.com/reference.html#url-template). This should launch a docker container that displays a Leaflet map using tiles from MapQuest.

## Other Examples / Otros ejemplos

Existen otros ejemplos que se pueden probar. Puede encontrar más información en OpenStreetMap wiki for [Tile Servers](http://wiki.openstreetmap.org/wiki/Tile_servers).

Here are some sample tile servers you can test. More can be found on the OpenStreetMap wiki for [Tile Servers](http://wiki.openstreetmap.org/wiki/Tile_servers).

### MapQuest Open Aerial

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://otile1.mqcdn.com/tiles/1.0.0/sat/{z}/{x}/{y}.jpg" -e "ATTRIBUTION=Tiles Courtesy of <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a> <img src=\"http://developer.mapquest.com/content/osm/mq_logo.png\">" openfirmware/nginx-leaflet

### HOT Style

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png" openfirmware/nginx-leaflet

### OpenCycleMap

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://a.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png" -e "ATTRIBUTION=Maps © <a href=\"http://www.thunderforest.com\">Thunderforest</a>, Data © <a href=\"http://www.openstreetmap.org/copyright\">OpenStreetMap contributors</a>" openfirmware/nginx-leaflet

### [Stamen Toner](http://maps.stamen.com/#toner)

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://a.tile.stamen.com/toner/{z}/{x}/{y}.png" -e "ATTRIBUTION=Map tiles by <a href=\"http://stamen.com\">Stamen Design</a>, under <a href=\"http://creativecommons.org/licenses/by/3.0\">CC BY 3.0</a>. Data by <a href=\"http://openstreetmap.org\">OpenStreetMap</a>, under <a href=\"http://www.openstreetmap.org/copyright\">ODbL</a>." openfirmware/nginx-
leaflet

## Todo / puntos pendientes

* Support subdomains for tile servers
* Support TMS standard servers
* Support custom default lat/lon/zoom