# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

 $ ->
    $('.edit_button').click ->
        comment = $(this).parent().parent()
        comment.find('.show').hide()
        comment.find('.buttons').hide()
        comment.find('.edit_new_rush_comment').show()

    $('.edit_button_cancel').click ->
        comment = $(this).parent().parent()
        comment.find('.show').show()
        comment.find('.buttons').show()
        comment.find('.edit_new_rush_comment').hide()
        
