function detectBrowser() {
  var useragent = navigator.userAgent;
  var mapdiv = document.getElementById("map_canvas");

  if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
    mapdiv.style.width = '100%';
    mapdiv.style.height = '100%';
  } else {
    mapdiv.style.width = '600px';
    mapdiv.style.height = '800px';
  }
}

var map;

function initialize() {
  var mapOptions = {
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map_canvas'),
      mapOptions);
  var trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);
      var infowindow = new google.maps.InfoWindow({
        content: 'This is where you are'
      });
      var marker = new google.maps.Marker({
            position: pos,
            map: map,
            title: 'My Location',
            icon: 'images/blue_world_small.png'
      });
      google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
      });
      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }

  $.each(Destinations, function(index, value) {
    if (value["gmap_lat_lng"] != '') {
      var vals = value["gmap_lat_lng"].split(",");
      var pos = new google.maps.LatLng(parseFloat(vals[0]), parseFloat(vals[1]));
      var infowindow = new google.maps.InfoWindow({
        content: value["description"]
      });
      var marker = new google.maps.Marker({
            position: pos,
            map: map,
            title: "Parking",
            icon: 'images/parking.png'
      });
      google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
      });
    }
  }) 
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(29.946122,-90.072613),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}
