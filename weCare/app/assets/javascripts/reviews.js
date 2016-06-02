$(document).on('ready', function(){
  $('#one-star')
    .on('click', function(){
    $('#rating-1').not(':checked').prop('checked', true)
    $('#rating-1').toggle('checked', false)
    $(this).toggleClass('satisfaction')
    $(this).toggleClass('star')

  });


  $('#two-star').on('click', function(){
    $('#rating-2').prop('checked', true)
    $(this,'#one-star').toggleClass('satisfaction')
    $(this,'#one-star').toggleClass('star')
  });

  $('#three-star').on('click', function(){
    $('#rating-3').prop('checked', true)
    $(this,'#one-star','#two-star').toggleClass('satisfaction')
    $(this,'#one-star','#two-star').toggleClass('star')
  });
  $('#four-star').on('click', function(){
    $('#rating-4').prop('checked', true)
  });
  $('#five-star').on('click', function(){
    $('#rating-5').prop('checked', true)
  });



  //
  // $('#rating-1').on('click', function(){
  //   $('#one-star').css("color","#40E0D0" )
  // });
  // $('#rating-2').on('click', function(){
  //   $('#one-star, #two-star').toggleClass("color","#40E0D0")
  // });
  // $('#rating-3').on('click', function(){
  //   $('#one-star, #two-star, #three-star').css("color","#40E0D0" )
  // });
  // $('#rating-4').on('click', function(){
  //   $('#one-star, #two-star, #three-star, #four-star').css("color","#40E0D0" )
  // });
  //
  // $('#rating-5').on('click', function(){
  //   $('.fa').css("color","#40E0D0" )
  // });
});
