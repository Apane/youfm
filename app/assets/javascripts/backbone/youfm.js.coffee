#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Youfm =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new Youfm.Routers.HomesRouter
    Backbone.history.start()

$(document).ready ->
  Youfm.init()