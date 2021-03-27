$(function() {
  $('.content').hover(
    function() {
      $(this).addClass('selected');
    },
    function() {
      $(this).removeClass('selected');
    }
  );
});