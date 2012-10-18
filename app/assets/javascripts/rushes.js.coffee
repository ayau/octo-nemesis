# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    # SHOW

    $('#edit_info_button').click ->
        info = $(this).parent().parent()
        info.find('.show').hide()
        info.find('.hide').show()

    $('#edit_info_button_cancel').click ->
        info = $(this).parent().parent().parent()
        info.find('.hide').hide()
        info.find('.show').show()

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
        value: 0,
        min: 0,
        max: 5,
        step: 1,
 
        slide: ((event, ui ) ->
            if $(this).hasClass('slider_pull')
                results = $('.slider_pull_results')
            else
                results = $('.slider_chill_results')
            results.html( ui.value )
        ),
        change: ((event, ui) ->
            if $(this).hasClass('slider_pull')
                form = $('#new_cprating_pull')
            else
                form = $('#new_cprating_chill')
            form.attr('value', ui.value)
        )
    )

    $('.slider_pull').slider('value', $('.slider_pull_results').text())

    $('.slider_chill').slider('value', $('.slider_chill_results').text())

    $('#friend_rush_friend_tokens').tokenInput('/api/v1/rushes/search', { 
        crossDomain: false,
        prePopulate: $('#friend_rush_friend_tokens').data('pre'),
        theme: 'facebook' 
    })

    $('.friend-btn').live 'click', ->
        $('.friend_show').hide()
        $('.friend_form').show()

    $('.friend-cancel-btn').live 'click', ->
        $('.friend_show').show()
        $('.friend_form').hide()

    

    # INDEX

    query = ''
    timer = null
    results = []
    table = null

    $('.search-query').keyup ()->
        query = $('.search-query').val().toLowerCase()
        search(query)

    search = (query) ->       
        table = $('.table')
        table.find('tr').each ->
            if query.length == 0 || $(this).hasClass('header')
                $(this).show()
                return
            first_name = $(this).find('.first_name').text().toLowerCase()
            last_name = $(this).find('.last_name').text().toLowerCase()

            if first_name.indexOf(query) >= 0 || last_name.indexOf(query) >= 0 || (first_name + ' ' + last_name).indexOf(query) >= 0
                $(this).show()
            else
                $(this).hide()
