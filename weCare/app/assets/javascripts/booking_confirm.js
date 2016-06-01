$(document).on('ready', function(){
  $('.booking_form').on('submit', function(){

        console.log("it works");
        var booking_info = $('form').serialize();
  $.ajax({
    url: "/profiles/params[:id]",
    method: "Post",
    dataType: "html",
    data: booking_info,
    success: function(data){
      console.log("it works?");
      $('.booking_modal').html("<%= render 'bookings/booking_confirm'%>");
    }

  });
  });
});
