wow = new WOW({
  animateClass: 'animated',
  offset: 100,
  mobile: false
});
wow.init();

$(document).on('mouseover', '.menu_notifications', function() {
  $('.noti-custom').slideDown(300);
});
$(document).on('mouseleave', '.menu_notifications', function() {
  $('.noti-custom').slideUp(300);
});
