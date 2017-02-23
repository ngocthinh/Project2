$(document).ready(function() {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {
        disableDefaultUI: true
        // vượt qua 1 số tùy chọn của Google Maps API tại đây
      },
      internal: {
        id: 'map'
      }
    },
    function(){
      markers = handler.addMarkers([
        {
          "lat": 16.066733,
          "lng": 108.213475,
          "picture": {
            "width":  32,
            "height": 32
          },
          "infowindow": "hello!"
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
    }
  );
  $(document).ready(ready);
  $(document).on('page:load', ready);
  google.maps.event.addDomListener(window, 'page:load', initialize);
  google.maps.event.addDomListener(window, 'load', initMap);
  google.maps.event.addDomListener(window, 'page:load', initMap);
});
