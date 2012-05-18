class Tiikt.Views.EventsEntry extends Backbone.View

  template: JST['events/entry']

  className: "event"
	  
  initialize: ->
    

  render: ->
    @$el.html(@template(event: @model))
    this
