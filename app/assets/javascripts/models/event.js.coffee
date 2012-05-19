class Tiikt.Models.Event extends Backbone.Model

  initialize: (attributes) ->
    @parse_attributes(attributes)
    super attributes
    
  parse: (response) ->
    @parse_attributes(response)
    super response
    
  parse_attributes: (attributes) ->
    if attributes.user?
      @user = new Tiikt.Models.User(attributes.user)
      delete attributes.user
