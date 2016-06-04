$(document).on('ready', function(){
  $('#view_review').on('click', function(){
    // alert("it works!");
    var profileId = $(this).data('id');

    $.ajax({
      url: '/reviews/index/' + profileId,
      method: 'GET',
      success: function(data){
        $('#show_review').append(data).slideDown("slow");

        $('.close').on('click', function(){
        $('.reviews').hide();
      });
    }
  });
});
});