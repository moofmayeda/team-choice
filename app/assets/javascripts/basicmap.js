function initialize() {
  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);

  var yourLatlng = new google.maps.LatLng(-27.363882,131.044922);

  var mapOptions = {
  zoom: 4,
  center: myLatlng
  }

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

// To add the marker to the map, use the 'map' property
var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title:"1st marker!"
});

var yourmarker = new google.maps.Marker({
    position: yourLatlng,
    map: map,
    title:"2nd marker!"
});

}
