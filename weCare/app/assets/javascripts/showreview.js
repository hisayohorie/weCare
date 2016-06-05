$(document).on('ready', function(){
  $('#view_review').on('click', function(){
    // alert("it works!");
    var profileId = $(this).data('id');

    $.ajax({
      url: '/profiles/'+profileId+'/reviews/',
      method: 'GET',
      success: function(data){
        $('#show_review').append(data);
        $('.close').on('click', function(){
        $('.reviews').hide();
      });
    }
  });
});
});
