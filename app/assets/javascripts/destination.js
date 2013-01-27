$(function(){

  $('#map_canvas').gmap().bind('init', function(evt, map) {
    $('#map_canvas').gmap('getCurrentPosition', function(position, status) {
      if ( status === 'OK' ) {
        var clientPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        $('#map_canvas').gmap('addMarker', {'position': clientPosition, 'bounds': true});
        $('#map_canvas').gmap('addShape', 'Circle', { 
          'strokeWeight': 0, 
          'fillColor': "#008595", 
          'fillOpacity': 0.25, 
          'center': clientPosition, 
          'radius': 15, 
          'clickable': false 
        });
      }
    });   
  });
  $('#map_canvas').gmap({'callback': function() {
    var self = this;
    self.getCurrentPosition(function(position, status) {
      if ( status === 'OK' ) {
        var clientPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        self.addMarker({'position': clientPosition, 'bounds': true});
        self.addShape('Circle', { 
          'strokeWeight': 0, 
          'fillColor': "#008595", 
          'fillOpacity': 0.25, 
          'center': clientPosition, 
          'radius': 15, 
          'clickable': false 
        });
      }
    });   
  }});
  $('#map_canvas').gmap('getCurrentPosition', function(position, status) {
    if ( status === 'OK' ) {
      var clientPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      $('#map_canvas').gmap('addMarker', {'position': clientPosition, 'bounds': true});
      $('#map_canvas').gmap('addShape', 'Circle', { 
        'strokeWeight': 0, 
        'fillColor': "#008595", 
        'fillOpacity': 0.25, 
        'center': clientPosition, 
        'radius': 15, 
        'clickable': false 
      });
    }
  });
});