App.notifications = App.cable.subscriptions.create("NotificationsChannel", {

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
     $("#notifications").prepend(data.html);
  }
  renderNotifications: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.checked + "</p>";
  }
});
