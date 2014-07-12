// This example uses a symbol to add a vector-based icon to a marker.
// The symbol uses one of the predefined vector paths ('CIRCLE') supplied by the
// Google Maps JavaScript API.

function initialize() {
  var mapOptions = {
    zoom: 4,
    center: new google.maps.LatLng(-25.363882, 131.044922)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var marker = new google.maps.Marker({
    position: map.getCenter(),
    icon: {
      path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
      scale: 4
    },
    draggable: true,
    map: map
  });

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(-28, 140),
    animation: google.maps.Animation.DROP,
    icon: {
      path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
      scale: 4
    },
    map: map
  });


}

google.maps.event.addDomListener(window, 'load', initialize);
