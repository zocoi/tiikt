class Tiikt.Models.Task extends Backbone.Model
  
  initialize: (attributes) ->
    @parse_attributes(attributes)
    super attributes
    
  parse: (response) ->
    @parse_attributes(response)
    super response
    
  parse_attributes: (attributes) ->
    if attributes.events?
      @events = new Tiikt.Collections.Events(attributes.events)
      @events.map (model) =>
        model.task = @
      delete attributes.events
    if attributes.users?
      @users = new Tiikt.Collections.Users(attributes.users)
      @users.map (model) =>
        model.task = @
      delete attributes.users
	
	  