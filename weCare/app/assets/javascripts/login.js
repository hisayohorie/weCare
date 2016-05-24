$(document).on('ready', function(){
  $('.login_button').on('click', function(e){

    $('.login_modal').fadeIn();
    e.preventDefault();

  });

  $('.close').on('click', function(){
    $('.login_modal').fadeOut();
  });

});
