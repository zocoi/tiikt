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
    # console.log @el, @$('.events')
    @$('.events').append(entry_view.render().el)

  # DOM events
  formSubmitted: (event) ->
    event.preventDefault()
    console.log event
    comment_event = new Tiikt.Models.CommentEvent()
    return false
    