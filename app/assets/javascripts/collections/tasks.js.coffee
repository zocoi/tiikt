class Tiikt.Collections.Tasks extends Backbone.Collection

  model: Tiikt.Models.Task
  url: '/tasks'
  
  comparator: (task) ->
    not task.get("is_completed")
