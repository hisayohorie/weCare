$(document).on('ready', function(){
    function initMap(){

      var locationDataLat = $('#map').attr("data-latitude");
      var locationDataLng = $('#map').attr("data-longitude");


    $.ajax({
      url: "/profiles?latitude="+locationDataLat+"&longitude="+locationDataLng,
      method: "get",
      data: {"locationDataLat": locationDataLat , "locationDataLng": locationDataLng },
      dataType: "script"

      });
    };



    initMap();
});
