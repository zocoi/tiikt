class Tiikt.Routers.Tasks extends Backbone.Router
  routes:
    "": "index"
  
  initialize: ->
    @tasks = new Tiikt.Collections.Tasks()
    @tasks.fetch()

  index: ->
    view = new Tiikt.Views.TasksIndex(collection: @tasks)
    $('#main-container').html(view.render().el)

  show: (id) ->
    alert "Entry #{id}"
    