$(Document).on('ready', function(){
  $('.login_button').on('click', function(e){
    e.preventDefault();

    $('.login_modal').fadeIn();

  });

  $('.close').on('click', function(){
    $('.login_modal').fadeOut();
  });

});
