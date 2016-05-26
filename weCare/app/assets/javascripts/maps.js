$(document).on('ready', function(){
    function initMap(){

      var locationDataLat = $('#map').attr("data-latitude");
      var locationDataLng = $('#map').attr("data-longitude");

    $.ajax({
      url: "/profiles",
      method: "get",
      data: {"locationDataLat": locationDataLat , "locationDataLng": locationDataLng },
      dataType: "script"

      });
    };






    initMap();
});
