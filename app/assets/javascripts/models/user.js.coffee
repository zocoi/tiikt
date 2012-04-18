class Tiikt.Models.User extends Backbone.Model
  
  initialize: (attributes) ->
    @parse_attributes(attributes)
    super attributes
    
  parse: (response) ->
    @parse_attributes(response)
    super response
    
  parse_attributes: (attributes) ->
    if attributes.friends?
      @set "friends", new Tiikt.Collections.Users(attributes.friends)
      delete attributes.friends
    
