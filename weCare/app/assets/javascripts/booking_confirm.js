$(document).on('ready', function(){
  $('#new_booking').on('submit', function(e){
    e.preventDefault();

    console.log("it works");
    var booking_info = $('form').serialize();
    var profileId = $(this).attr('data-id');
    alert(profileId);
    $.ajax({
      url: "/profiles/" + profileId + "/bookings",
      method: "POST",
      dataType: "html",
      data: booking_info,
      success: function(data){
        console.log("it works?");
        $('.booking_modal').html(data);
      }
    });
  });
});
