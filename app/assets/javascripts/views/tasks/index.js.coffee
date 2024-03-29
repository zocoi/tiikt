class Tiikt.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']
  
  events:
    'submit #new-task': 'formSubmitted'
    
    
  initialize: ->
    console.log @, @collection
    @collection.on('reset', @render, this)
    @collection.on('add', @task_added, this)

  render: =>
    $(@el).html(@template())
    @collection.each(@render_task)
    this
  
  task_added: (task) ->
    @render_task(task)
    
  render_task: (task) ->
    entry_view = new Tiikt.Views.TasksEntry(model: task)
    @$('#tasks').prepend(entry_view.render().el)
    
  # DOM events
  formSubmitted: (event) ->
    event.preventDefault()
    attributes = {
      description: @$('#task-description').val()
    }
    @collection.create attributes, {
      error: @handleError
    }
    @$('#task-description').val("")
      

  handleError: (entry, response) ->
    errors = $.parseJSON(response.responseText).errors
    for attribute, messages of errors
      console.log "#{attribute} #{message}" for message in messages
      

    
  
    