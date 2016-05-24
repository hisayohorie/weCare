$(document).on('ready', function() {
  $(".signup_button").on('click', function(e){
    e.preventDefault();
    $(".signup_modal").fadeIn();
  });

  $(".close").on('click', function(){
    $(".signup_modal").fadeOut();
  });
});
