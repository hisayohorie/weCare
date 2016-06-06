
$(document).on('ready', function(){
  console.log('hello!');
  $('#makeReview').on('click', function(){
    var profileId = $(this).data('id');
    $.ajax({
      url: '/reviews/new/' + profileId,
      method: 'GET',
      success: function(data) {
        $('#reviewContainer').html(data);
        bindFormToAjaxPost($('#new_review'), profileId);
        $('#makeReview').fadeOut(function(){
          $('#reviewContainer').slideDown();
        });
        star_check();
      }
    });
  });
});
function star_check(){
  $('#one-star').on('click', function(){
    $(this).css('color', '#40E0D0');
    $('#two-star, #three-star, #four-star, #five-star').css('color', '#AAF200');
  });
  $('#two-star').on('click', function(){
    $('#two-star, #one-star').css('color', '#40E0D0');
    $('#three-star, #four-star, #five-star').css('color', '#AAF200');
  });
  $('#three-star').on('click', function(){
    $('#two-star, #one-star, #three-star').css('color', '#40E0D0');
    $('#four-star, #five-star').css('color', '#AAF200');
  });
  $('#four-star').on('click', function(){
    $('#two-star, #one-star, #three-star, #four-star').css('color', '#40E0D0');
    $('#five-star').css('color', '#AAF200');
  });
  $('#five-star').on('click', function(){
    $('#two-star, #one-star, #three-star, #four-star, #five-star').css('color', '#40E0D0');
  });
  $('#dependability_1').on('click', function(){
    $(this).css('color', '#40E0D0');
    $('#dependability_2, #dependability_3, #dependability_4, #dependability_5').css('color', '#AAF200');
  });
  $('#dependability_2').on('click', function(){
    $('#dependability_1, #dependability_2').css('color', '#40E0D0');
    $('#dependability_3, #dependability_4, #dependability_5').css('color', '#AAF200');
  });
  $('#dependability_3').on('click', function(){
    $('#dependability_1, #dependability_2,#dependability_3').css('color', '#40E0D0');
    $('#dependability_4, #dependability_5').css('color', '#AAF200');
  });
  $('#dependability_4').on('click', function(){
    $('#dependability_1, #dependability_2,#dependability_3, #dependability_4').css('color', '#40E0D0');
    $('#dependability_5').css('color', '#AAF200');
  });
  $('#dependability_5').on('click', function(){
    $('#dependability_1, #dependability_2,#dependability_3, #dependability_4, #dependability_5').css('color', '#40E0D0');
  });
  $('#punctuality_1').on('click', function(){
    $(this).css('color', '#40E0D0');
    $('#punctuality_2, #punctuality_3, #punctuality_4, #punctuality_5').css('color', '#AAF200');
  });
  $('#punctuality_2').on('click', function(){
    $('#punctuality_1, #punctuality_2').css('color', '#40E0D0');
    $('#punctuality_3, #punctuality_4, #punctuality_5').css('color', '#AAF200');
  });
  $('#punctuality_3').on('click', function(){
    $('#punctuality_1, #punctuality_2, #punctuality_3').css('color', '#40E0D0');
    $('#punctuality_4, #punctuality_5').css('color', '#AAF200');
  });
  $('#punctuality_4').on('click', function(){
    $('#punctuality_1, #punctuality_2, #punctuality_3, #punctuality_4').css('color', '#40E0D0');
    $('#punctuality_5').css('color', '#AAF200');
  });
  $('#punctuality_5').on('click', function(){
    $('#punctuality_1, #punctuality_2, #punctuality_3, #punctuality_4, #punctuality_5').css('color', '#40E0D0');
  });
  $('#reliable_transportation_1').on('click', function(){
    $(this).css('color', '#40E0D0');
    $('#reliable_transportation_2, #reliable_transportation_3, #reliable_transportation_4, #reliable_transportation_5').css('color', '#AAF200');
  });
  $('#reliable_transportation_2').on('click', function(){
    $('#reliable_transportation_1, #reliable_transportation_2').css('color', '#40E0D0');
    $('#reliable_transportation_3, #reliable_transportation_4, #reliable_transportation_5').css('color', '#AAF200');
  });
  $('#reliable_transportation_3').on('click', function(){
    $('#reliable_transportation_1, #reliable_transportation_2, #reliable_transportation_3').css('color', '#40E0D0');
    $('#reliable_transportation_4, #reliable_transportation_5').css('color', '#AAF200');
  });
  $('#reliable_transportation_4').on('click', function(){
    $('#reliable_transportation_1, #reliable_transportation_2, #reliable_transportation_3, #reliable_transportation_4').css('color', '#40E0D0');
    $('#reliable_transportation_5').css('color', '#AAF200');
  });
  $('#reliable_transportation_5').on('click', function(){
    $('#reliable_transportation_1, #reliable_transportation_2, #reliable_transportation_3, #reliable_transportation_4, #reliable_transportation_5').css('color', '#40E0D0');
  });
  $('#hire_again_1').on('click', function(){
    $(this).css('color', '#40E0D0');
    $('#hire_again_2, #hire_again_3, #hire_again_4, #hire_again_5').css('color', '#AAF200');
  });
  $('#hire_again_2').on('click', function(){
    $('#hire_again_1, #hire_again_2').css('color', '#40E0D0');
    $('#hire_again_3, #hire_again_4, #hire_again_5').css('color', '#AAF200');
  });
  $('#hire_again_3').on('click', function(){
    $('#hire_again_1, #hire_again_2, #hire_again_3').css('color', '#40E0D0');
    $('#hire_again_4, #hire_again_5').css('color', '#AAF200');
  });
  $('#hire_again_4').on('click', function(){
    $('#hire_again_1, #hire_again_2, #hire_again_3, #hire_again_4').css('color', '#40E0D0');
    $('#reliable_transportation_5').css('color', '#AAF200');
  });
  $('#hire_again_5').on('click', function(){
    $('#hire_again_1, #hire_again_2, #hire_again_3, #hire_again_4, #hire_again_5').css('color', '#40E0D0');
  });
}
function bindFormToAjaxPost($form, profileId){
  $form.on('submit', function(e){
    var reviewData = $form.serialize();
    $.ajax({
      url: '/profiles/' + profileId + '/reviews',
      method: 'POST',
      data: reviewData,
      dataType: "HTML",
      success: function(data) {
        $('#new_review').slideUp(function(){
          $('#makeReview').fadeIn();

          if($('.reviews').length > 0){
            $('.reviews').append(data);
          }
        });
      }
     });
     e.preventDefault();
  });
}
