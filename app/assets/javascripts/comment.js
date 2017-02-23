$(document).ready(function() {
  $('.comment-from #content').keypress(function(e){
    if(e.which == 13){
      $(this).closest('form').submit();
        $('.modal-body').stop().animate({
          scrollTop: $('.modal-body')[0].scrollHeight
         }, 800
      );
    }
  });
});
