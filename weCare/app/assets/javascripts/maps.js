$(document).on('ready', function(){
    function initMap(){


    var mapPlaceholder = $("#map");
    var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')};
    var map = new google.maps.Map(mapPlaceholder[0], {
    center: latLong,
    zoom: 12
    });

    var marker = new google.maps.Marker({
    position: latLong,
    map: map,
    title: 'Hello World!'
    });
    }

    initMap();
});
