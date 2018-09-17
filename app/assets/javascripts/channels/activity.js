(function() {
  App.activity = App.cable.subscriptions.create "ActivityChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {}
  }, $('#events').prepend("" + event.message));
}).call(this);
