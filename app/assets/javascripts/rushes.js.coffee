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

    $( ".slider" ).slider(
        animate: true,
        range: "min",
        value: 5,
        min: 0,
        max: 5,
        step: 1,
 
        # this gets a live reading of the value and prints it on the page
        slide: ((event, ui ) ->
            if $(this).hasClass('slider_pull')
                results = $('.slider_pull_results')
            else
                results = $('.slider_chill_results')
            results.html( ui.value )
        ),
        # this updates the hidden form field so we can submit the data using a form
        change: ((event, ui) ->
            if $(this).hasClass('slider_pull')
                form = $('.slider_pull_form')
            else
                form = $('.slider_chill_form')
            form.attr('value', ui.value)
        ))

        
