$(document).on('ready', function() {
  $(".signup_button").on('click', function(e){
    e.preventDefault();
    $(".modal-dialog").fadeIn();
    $(".signup_modal").fadeIn();
  });

  $(".close").on('click', function(){
    $(".signup_modal").fadeOut();
    $(".modal-dialog").hide();
  });
});
