$(document).on('ready', function(){
  $('#makeReview').on('click', function() {
    var profileId = $(this).data('id');
    $.ajax({
      url: '/reviews/getform/'+profileId,
      method: 'GET',
      success: function(data) {
        $('#reviewContainer').html(data);
        $('#makeReview').fadeOut(function() {
        $('#reviewContainer').slideDown();
        });
      }
    });
  });
});
