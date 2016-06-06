$(document).on('ready', function(){
  $('#view_review').on('click', function(){
    var profileId = $(this).data('id');

    $.ajax({
      url: '/reviews/index/' + profileId,
      method: 'GET',
      dataType: 'html',
      success: function(data){
        $('.reviews').append(data).slideDown("slow");
        $('.close').on('click', function(){
        $('.reviews').hide();
      });
    }
  });
});
});
