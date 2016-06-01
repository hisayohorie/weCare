$(document).on('ready', function(){
  $('.login_button').on('click', function(e){
    e.preventDefault();

    $(".modal-dialog").fadeIn();
    $('.login_modal').fadeIn();
    e.stopPropagation()
  });

  $('.close').on('click', function(){
    $('.login_modal').fadeOut();
    $(".modal-dialog").hide();
  });

});
