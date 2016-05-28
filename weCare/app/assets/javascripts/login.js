$(document).on('ready', function(){
  $('.login_button').on('click', function(e){
    e.preventDefault();
    e.stopPropagation();
    $('.login_modal').fadeIn();
    e.preventDefault();

  });

  $('.close').on('click', function(){
    $('.login_modal').fadeOut();
  });

});
