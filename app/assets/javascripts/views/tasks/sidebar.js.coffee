class Tiikt.Views.TasksSidebar extends Backbone.View
  template: JST['tasks/sidebar']
  
  className: "well sidebar-nav"
  
  events:
    'click .description-text': 'descriptionTextClicked'
    'blur .description-textarea': 'descriptionTextareaEdited'
    'keyup .description-textarea': 'descriptionTextareaKeyup'
  
  initialize: ->
    @model.on("change:description", @render, @)
    @model.on("change:due_at", @render, @)

  render: ->
    $(@el).html(@template(task: @model))
    @$(".date-text").timeago()
    # console.log @$(".date-input").data("date-format"), @$(".date-input").data("date")
    @$(".date-input").datepicker()
    @$(".date-input").on('changeDate', @dateChanged)
    # console.log @$(".friend-select")
    _.defer =>
      @$(".friend-select").chosen()

    # Render events
    events_view = new Tiikt.Views.EventsIndex(collection: @model.events)
    events_view.task = @model
    @$('.activity').prepend(events_view.render().el)
    
    # Tabs
    @$('a[data-toggle="tab"]').click ->
      $(this).tab('show')
    
    # Delegate events
    @delegateEvents(@events)
    this  
    
  # DOM events
  descriptionTextClicked: ->
    @$('.description-text').hide()
    @$('.description-textarea').show().focus()
  
  descriptionTextareaEdited: ->
    @model.set {
      description: @$('.description-textarea').val()
    }
    @model.save() if @model.hasChanged("description")
    @$('.description-text').show()
    @$('.description-textarea').hide()
  
  descriptionTextareaKeyup: (e) ->
    if e.keyCode == 13 && e.shiftKey
      # normal line break
    else if e.keyCode == 13
      @descriptionTextareaEdited(e)

  dateChanged: (event) =>
    @$(".date-input").datepicker('hide');
    attributes = {
      due_at: event.date.toString("yyyy-MM-dd")
    }
    @model.save(attributes)
  
    