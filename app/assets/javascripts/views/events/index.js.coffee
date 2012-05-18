class Tiikt.Views.EventsIndex extends Backbone.View

  template: JST['events/index']

  className: "events_index"
    
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @event_added, this)

  render: ->
    $(@el).html(@template())
   	@collection.each(@render_event)
    this
  
  event_added: (event) ->
    @render_event(event)

  render_event: (event) ->
    entry_view = new Tiikt.Views.EventsEntry(model: event)
    console.log @$('.events')
    @$('.events').append(entry_view.render().el)

