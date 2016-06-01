$(document).on('ready', function(){  
  $('#rate').on('change mousedown' , function(){
    var value = $(this).val()
    $('#rate_label').html('Rate $' + value);
  });
});
