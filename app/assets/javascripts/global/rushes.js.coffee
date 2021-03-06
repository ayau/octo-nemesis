# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    # SHOW

    $('.edit_info_button').live 'click', ->
        dl = $(this).parent().parent()
        dl.find('.show').hide()
        dl.find('.edit_rush_info').show()

    $('.edit_info_button_cancel').live 'click', ->
        dl = $(this).parent().parent()
        dl.find('.edit_rush_info').hide()
        dl.find('.show').show()

    $('.edit_button').live 'click', ->
        comment = $(this).parent().parent()
        comment.find('.show').hide()
        comment.find('.buttons').hide()
        comment.find('.edit_new_rush_comment').show()

    $('.edit_button_cancel').live 'click', ->
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

    $('.contact-btn').live 'click', ->
        $('.contact_show').hide()
        $('.contact_form').show()

    $('.contact-cancel-btn').live 'click', ->
        $('.contact_show').show()
        $('.contact_form').hide()

    $('#contact_rush_contacts').tokenInput('/api/v1/users/search', { 
        crossDomain: false,
        prePopulate: $('#contact_rush_contacts').data('pre'),
        theme: 'facebook' 
    })

    

    # INDEX

    query = ''
    timer = null
    results = []
    table = null

    visible = null

    $('.search-rushes').keyup ()->
        query = $('.search-rushes').val().toLowerCase()
        search(query)

    search = (query, callback) ->
        visible = null
        count = 0 # counts number of queries
       
        table = $('.table')
        table.find('tr').each ->
            if query.length == 0 || $(this).hasClass('header')
                $(this).show()
                return
            first_name = $(this).find('.first_name').text().toLowerCase()
            last_name = $(this).find('.last_name').text().toLowerCase()

            if first_name.indexOf(query) >= 0 || last_name.indexOf(query) >= 0 || (first_name + ' ' + last_name).indexOf(query) >= 0
                $(this).show()
                visible = $(this)
                count += 1
            else
                $(this).hide()

        callback(count) if callback?

    # When url has ?q=xxx parameter
    init = (param) ->
        if param.indexOf('?q=') isnt 0
            return
        
        query = param.substring(3)
        query = query.toLowerCase()
        
        queries = query.split('+') 
        for q in queries
            q = q.replace(/[^A-Za-z0-9]/g, '')
        query = queries.join(' ')
        
        if query.length is 0
            return

        $('.search-rushes').val(query)

        search query, (count) ->
            if count is 1
                visible.click()
            else if count is 0
                window.location = '/rushes/new?name=' + query

    init(location.search)


    # NEW
    init_new = (param) ->
        if param.indexOf('?name=') isnt 0
            $('#rush_name').focus()
            return
        
        query = param.substring(6)
        query = unescape(query)
        queries = query.split(' ')
        
        query = ''

        for q in queries
            q = q.replace(/[^A-Za-z0-9]/g, '')
            q = q.charAt(0).toUpperCase() + q.substr(1)
            if query.length > 0
                query += ' '
            query += q

        if query.length is 0
            $('#rush_name').focus()
            return

        $('#rush_name').val(query)
        $('#rush_phone').focus()

    init_new(location.search)


    # Arrow key control
    $('html').keydown (e) ->
        if !$('textarea').is(":focus") && !$('input').is(":focus") && $('.rush').length > 0
            if e.keyCode is 39
                # right
                if $('.next_rush').length is 0
                    alert 'this is the last rush'
                else
                    $('.next_rush')[0].click()
            else if e.keyCode is 37
                # left 
                console.log $('.prev_rush').length
                if $('.prev_rush').length is 0
                    alert 'this is the first rush'
                else
                    $('.prev_rush')[0].click()
                


