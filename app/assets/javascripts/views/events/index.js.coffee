class Tiikt.Views.EventsIndex extends Backbone.View

  template: JST['events/index']

  className: "events_index"
    
  events:
    'submit .comment-form': 'formSubmitted'
    
    
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @event_added, this)

  render: ->
    $(@el).html(@template())
   	@collection.each(@render_event)
    this
  
  event_added: (event) ->
    @render_event(event)

  render_event: (event) =>
    entry_view = new Tiikt.Views.EventsEntry(model: event)
    @$('.events').append(entry_view.render().el)

  # DOM events
  formSubmitted: (event) ->
    text = @$('.comment-input').val()
    return false if text.length < 4
    comment_event = @collection.create({
      body: text
      type: "CommentEvent"
      user_id: current_user.id
      task_id: @task.id
      user: current_user.toJSON()
      task: @task.toJSON()
    })
    comment_event.user = current_user
    comment_event.task = @task
    @$('.comment-input').val("")
    return false
    