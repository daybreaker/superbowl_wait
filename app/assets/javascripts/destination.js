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

        
  var openInfoWindow = null;
  var default_content, icon;
  icon = 'images/parking.png'; 
  default_content = "Availability unknown at ";
  
  $.each(Destinations, function(index, value) {
    var content = default_content;
    var pos = new google.maps.LatLng(parseFloat(value["lat"]), parseFloat(value["long"]));
    
    var marker = new google.maps.Marker({
        position: pos,
        map: map,
        title: "Bathroom",
        icon: icon
    });
    
            
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        //position.coords.latitude
        buildInfoWindow(position.coords.latitude, position.coords.longitude);

      }, function(){
         buildInfoWindow(false, false);
      });
      
    } else {
      buildInfoWindow(false, false);
    }
        
    function buildInfoWindow(lat, long){
      var winContent = content + value["description"];
      
      if (lat !== false){
         winContent += '<br /><br /><a href="https://maps.google.com/maps?f=d&source=s_d&saddr=' + lat + ',' + long + '&daddr=' + value["description"].replace(/\s/g,"+") + '" target="_blank">Directions</a>';
      }
      
      var infowindow = new google.maps.InfoWindow({
        content: winContent,
        maxWidth: 200
      });
      
      google.maps.event.addListener(marker, 'click', function() {
        if (openInfoWindow != null) {openInfoWindow.close();}
          infowindow.open(map,marker);
          openInfoWindow = infowindow;
      });
    
    }
        
  });
  
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
