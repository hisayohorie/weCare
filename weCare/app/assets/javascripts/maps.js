$(document).on('ready', function(){
  if ($('#map').length > 0){
    function initMap(){

      var locationDataLat = $('#map').attr("data-latitude");
      var locationDataLng = $('#map').attr("data-longitude");
      var locationDistance = $('#map').attr("data-distance");

    $.ajax({
      url: "/profiles",
      method: "get",
      data: {"latitude": locationDataLat , "longitude": locationDataLng, "distance":locationDistance},
      dataType: "script"

      });
    };
    initMap();
  };
});
