# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

 $(document).ready ->
  $(".edit_new_rush_comment").hide()
  $(".edit_button").click ->
    if $(this).next(".edit_new_rush_comment").is(":visible")
      $(this).next(".edit_new_rush_comment").hide()
    else
      $(this).next(".edit_new_rush_comment").show()

