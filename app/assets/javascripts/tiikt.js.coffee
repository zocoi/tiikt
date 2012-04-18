window.Tiikt =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Tiikt.Routers.Tasks();
    Backbone.history.start();
