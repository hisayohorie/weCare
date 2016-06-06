$(document).on('ready', function(){
  $('#view_review').on('click', function(){
    var profileId = $(this).data('id');
    var indexData = $('form').serialize();
    $.ajax({
      url: '/reviews/index/' + profileId,
      method: 'GET',
      dataType: 'html',
      success: function(indexData){
        $('#show_review').append(indexData).slideDown("slow");
        $('.close').on('click', function(){
        $('.reviews').hide();
      });
    }
  });
});
});
