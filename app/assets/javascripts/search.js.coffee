$ ->

    search = $('#search')
    search_results = $('#search_results')
    timer = null
    query = ''
    max_results = 10
    more_results = false
    cached_results = []
    last_input = ''
    cached_query = ''

    $('html').live 'click', () ->
        search_results.hide()

    $('.search').live 'click', (event) ->
        event.stopPropagation()
     
    search.focus (e) ->
        performSearch()

    search.keyup (e) ->
        performSearch()

    performSearch = ->
        search_val = search.val()

        search_val = $.trim(search_val)
        
        if search_val.indexOf(cached_query) is 0 and !more_results and cached_results.length > 0
            last_input = search_val
            internal_query last_input
            return

        search_results.empty()
        console.log search_val
        input = search_val
        last_input = input
        
        if input is query or input is ''
            return

        search_results.append '<li><img src="http://www.weathermodule.com/images/loading_dots.gif"/></li>'

        if timer
            window.clearTimeout timer

        timer = window.setTimeout (() -> submit_query input), 300


    submit_query = (input) ->
        query = input
        $.ajax({
            type: "GET",
            url: '/events/search'
            data: {
                search: query
            }
            success: (results) ->
                display_results results, query          
        })

    display_results = (results, query) ->
        search_results.empty()

        if results.length is 0
            search_results.append '<li>No events found..</li>'
        
        if results.length >= max_results
            more_results = true
        else
            more_results = false

        # console.log results

        for r in results

            search_results.append('<li><a class="attend_event" event_id="' + r.id + '">' + r.name + '</a></li>')

        cached_results = results
        cached_query = query
        console.log 'cached_query: ' + query
        search_results.show()

    internal_query = (input) ->
        search_results.empty()
        count = 0
        # console.log cached_results
        for r in cached_results
            if r.name.toLowerCase().indexOf(input.toLowerCase()) isnt -1
        
                search_results.append('<li><a class="attend_event" event_id="' + r.id + '">' + r.name + '</a></li>')

                count = count + 1

        if count is 0
            search_results.append '<li>No events found..</li>'
        
        search_results.show()


    $('.attend_event').live 'click', () ->
        $('#event_id').val($(this).attr('event_id'))
        $('.event_form').submit()