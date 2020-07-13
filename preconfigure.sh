#/bin/bash

set -e

if [ -z "$TILESERVER" ]; then
  TILESERVER="http://{s}.tile.osm.org/{z}/{x}/{y}.png"
fi

if [ -z "$ATTRIBUTION" ]; then
  ATTRIBUTION="&copy; <a href=\"http://osm.org/copyright\">OpenStreetMap</a> contributors"
fi

echo "using Tile Server: $TILESERVER"
echo "attribution: $ATTRIBUTION"

cat <<HERE >/usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>CENIGA Visor Geoespacial - Leaflet</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  
 

  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
 
  <style>
    body {
      padding: 0px;
      margin: 0px;
      height: 100%;
      width: 100%;
    }
    #map {
      width: 100%;
      height: 100%;
    }
  </style>
</head>
<body>
  <div id="map"></div>

<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>


  <script src="//cdnjs.cloudflare.com/ajax/libs/zepto/1.1.4/zepto.min.js"></script>
  <script src="autosize.js"></script>
  <script>
    Autosize.enable();
    var map = L.map('map').setView([9.5, -84], 8);

    L.tileLayer('${TILESERVER}', {
      attribution: '${ATTRIBUTION}'
    })
      .addTo(map);

    L.tileLayer('${TILESERVER2}', {
      attribution: '${ATTRIBUTION2}'
    })
      .addTo(map);

  </script>
</body>
</html>
HERE

nginx -g "daemon off;"
