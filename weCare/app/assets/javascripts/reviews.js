$(document).on('ready', function(){
  $('#rating-1').on('click', function (){
    $('#one-star').css("color","#40E0D0")
  });
  $('#rating-2').on('click', function(){
    $('#one-star, #two-star').css("color","#40E0D0")
  });
  $('#rating-3').on('click', function(){
    $('#one-star, #two-star, #three-star').css("color","#40E0D0" )
  });
  $('#rating-4').on('click', function(){
    $('#one-star, #two-star, #three-star, #four-star').css("color","#40E0D0" )
  });

  $('#rating-5').on('click', function(){
    $('.fa').css("color","#40E0D0" )
  });
});
