function submitNewcomment(){
  $('#user_search').keydown(function(event) {
    if (event.keyCode == 13) {
      $('#search_form').submit();
        return false;
    }
  });
}
