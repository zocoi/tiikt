class Tiikt.Views.Entry extends Backbone.View
  template: JST['tasks/entry']
  tagName: 'li'
  className: 'entry'
  
  events:
    'click': 'entryClicked'
    'click .toggle-completed': 'toggleCompletedClicked'

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    if @model.get("is_completed")
      @$el.addClass("completed")
    else
      @$el.removeClass("completed")
    @$el.html(@template(task: @model))
    this
  
  # DOM events
  entryClicked: ->
    console.log "entryClicked"
    if @$el.hasClass("selected")
      return
    $(".entry").removeClass("selected")
    @$el.addClass("selected")
    unless @model.sidebar_view?
      console.log "new"
      sidebar_view = new Tiikt.Views.Sidebar(model: @model)
      @model.sidebar_view = sidebar_view
    console.log @model.sidebar_view.render()
    $('#sidebar').html(@model.sidebar_view.render().el)
    
  toggleCompletedClicked: (e) ->
    console.log "toggleCompleted"
    @model.set("is_completed",  !@model.get("is_completed") )
    @model.save()
    @model.collection.sort()
    e.stopPropagation()
    
  
