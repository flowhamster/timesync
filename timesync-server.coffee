Meteor.publish '', ->
  ready = false;

  @added("timesync", 10, time: Date.now());
  id = Meteor.setInterval =>
    @changed("timesync", 10, time: Date.now());
  , 10

  @ready()

  @onStop ->
    Meteor.clearInterval(id)
