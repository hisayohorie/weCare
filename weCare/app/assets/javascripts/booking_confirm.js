$(document).on('ready', function(){
  $('#new_booking').on('submit', function(e){
    e.preventDefault();

    var booking_info = $('form').serialize();
    var profileId = $(this).attr('data-id');

    $.ajax({
      url: "/profiles/" + profileId + "/bookings",
      method: "POST",
      dataType: "html",
      data: booking_info,
      success: function(data){
        $('.booking_modal').html(data);
      }

    });

    $('body').on('click', '.close', function(){
      $('.booking_modal').hide();
      $(".modal-dialog").hide();
    });
  });
});
