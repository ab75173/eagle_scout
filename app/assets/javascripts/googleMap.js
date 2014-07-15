// This example uses a symbol to add a vector-based icon to a marker.
// The symbol uses one of the predefined vector paths ('CIRCLE') supplied by the
// Google Maps JavaScript API.

$(function(){

    // Setup the Google Map
    var mapOptions = {
      center: new google.maps.LatLng(39.8282, -98.5795),
      zoom: 4
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

    function placeMarker(project) {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(project.latitude, project.longitude),
        map: map,
        url: '/users/'+ project.user_id +'/projects/' + project.id,
        icon:  {
          path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
          scale: 4
          },
      });


    google.maps.event.addListener(marker, 'click', function() {
    window.location.href = marker.url;
    });


    google.maps.event.addListener(marker, 'mouseover', function() {
    infowindow.open(map,marker);
    });

    google.maps.event.addListener(marker, 'mouseout', function() {
    infowindow.close(map,marker);
    });

    var contentString = 'hello world'

    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });



  }


    // Load pins
    $.getJSON("/projects/all").then(function(projects){
      $.each(projects, function(index, project){
        placeMarker(project);
      });
    });
});

//function initialize() {
//  var mapOptions = {
//    zoom: 1,
//    center: new google.maps.LatLng(-25.363882, 131.044922)
//  };
//
//  var map = new google.maps.Map(document.getElementById('map-canvas'),
//      mapOptions);
//
//  var marker = new google.maps.Marker({
//    position: map.getCenter(),
//    icon: {
//      path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
//      scale: 4
//    },
//    draggable: true,
//    map: map
//  });
//
//  var marker2 = new google.maps.Marker({
//    position: new google.maps.LatLng(latitude, longitude),
//    animation: google.maps.Animation.DROP,
//    icon: {
//      path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
//      scale: 4
//    },
//    map: map
//  });
//
//  displayPins();
//
//}
//
//function displayPins( project ) {
//  for ( var i = 0, num = project.length; i < num; i++ ) {
//    var location = new google.maps.LatLng( projects[i].latitude, projects[i].longitude );
//    var newMarker = new google.maps.Marker({
//      position: location,
//      map: map
//    });
//  }
//}
//
//google.maps.event.addDomListener(window, 'load', initialize);

