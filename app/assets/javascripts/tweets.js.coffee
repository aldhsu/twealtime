# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#get data
$(document).ready(->
  websocket_uri = $('[data_uri]').attr('data_uri')
  dispatcher = new WebSocketRails(websocket_uri)
  dispatcher.bind('message', (data)->
    console.log(data);
  )

)