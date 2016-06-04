
$(document).on('ready', function(){
  $('#makeReview').on('click', function(){
    var profileId = $(this).data('id');
    $.ajax({
      url: '/reviews/getform/' + profileId,
      method: 'GET',
      success: function(data) { $('#reviewContainer').html(data);
        bindFormToAjaxPost($('#new_review'), profileId);
        $('#makeReview').fadeOut(function(){ $('#reviewContainer').slideDown();
          })
      }
    });
  });
});

function bindFormToAjaxPost($form, profileId){
  $form.on('submit', function(e){
    e.preventDefault();

    $.ajax({
      url: '/profiles/' + profileId + '/reviews',
      method: 'POST',
      data: $form.serialize(),
      dataType: "HTML",
      success: function(data) {
       $('.reviews').append($form);
       $('#makeReview').fadeIn();

      }

    });
          return false
  });
}
