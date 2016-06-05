// $(document).on('ready', function(){
//   $('#makeReview').on('click', function() {
//     var profileId = $(this).data('id');
//     $.ajax({
//       url: '/reviews/getform/'+profileId,
//       method: 'GET',
//       success: function(data) {
//         $('#reviewContainer').html(data);
//         $('#makeReview').fadeOut(function() {
//         $('#reviewContainer').slideDown();
//         });
//       }
//     });
//   });
// });

//
// $(document).on('ready', function(){
// $('#makeReview').on('click', function(){
//   var profileId = $(this).data('id');
//   $.ajax({
//     url: '/reviews/getform/' + profileId,
//     method: 'GET',
//     success: function(data) { $('#reviewContainer').html(data);
//       bindFormToAjaxPost($('new_form'), profileId);
//       $('#makeReview').fadeOut(function(){ $('#reviewContainer').slideDown();
//         })
//     }
//     });
//
//     bindFormToAjaxPost($form, profileId)({
//       $('#new_review').on('submit', function(){
//         var $form = $("#new_review");
//         $.ajax({
//           url: '/profiles/' + profileId + '/reviews/new',
//           method: 'POST',
//           data: $form,
//           dataType: "HTML"
//         });
//         });
//     })
//   });
// });


$(document).on('ready', function(){
  $('#makeReview').on('click', function(){
    var profileId = $(this).data('id');
    $.ajax({
      url: '/profiles/'+profileId+'/reviews/new/',
      method: 'GET',
      success: function(data) { $('#reviewContainer').html(data);
        bindFormToAjaxPost($('#new_review'), profileId);
        $('#makeReview').fadeOut(function(){ $('#reviewContainer').slideDown();
      });
star_check();
      }
    });
  });
});
function star_check(){
  // $('.stars').on('click', function(){
  //   $('.stars').nextAll().css('color', '#40E0D0');
  //    $('.stars').prevAll().css('color', '#f00');
  // });


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
}



function bindFormToAjaxPost($form, profileId){
  $form.on('submit', function(e){
    e.preventDefault();

    $.ajax({
      url: '/profiles/' + profileId + '/reviews',
      method: 'POST',
      data: form.serialize(),
      dataType: "HTML",
      success: function(data) {
       $('.reviews').append($form);
      }

    });
          return false
  });
}
