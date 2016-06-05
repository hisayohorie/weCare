function bindStarlabel() {
  $('.star-label').on('click', function() {
    $('.selected').removeClass('selected');
    $(this).addClass('selected');
    $(this).prevAll().addClass('selected');
  });
}
