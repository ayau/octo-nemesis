# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    timer = null

    $('#openrush_photo').val('')

    $('#photobooth').photobooth().on "image", (event, url) ->
        $("#openrush_photo").val(url)
        $('.demo-photo').show()
        $('.demo-photo').attr('src', url)
        $('.photo-taken').show()
        $('.photo-button').removeAttr('disabled')
        $('.photo-button').val('Retake photo')

    $('.photo-button').live 'click', () ->
        $(this).attr('disabled', 'disabled')
        timer = setInterval(trigger, 1000)
        $('.demo-photo').hide()
        $('.countdown').text('3')

    countdown = 2

    trigger = () ->
        if countdown > 0 
            $('.countdown').text(countdown)
            countdown -= 1
        else
            $('.trigger').click()
            $('.countdown').text('')
            countdown = 2
            clearInterval(timer)

    $('.fake-submit').live 'click', () ->
        
        $('#openrush_name').val( cleanInput($('#openrush_name').val()))
        $('#openrush_email').val( cleanInput($('#openrush_email').val()))
        $('#openrush_phone').val( cleanInput($('#openrush_phone').val()))
        $('#openrush_residence').val( cleanInput($('#openrush_residence').val()))
        $('#openrush_year').val( cleanInput($('#openrush_year').val()))
        $('#openrush_photo').val( cleanInput($('#openrush_photo').val()))

        error_string = ''
        
        error_string += makeError('name', $('#openrush_name').val())
        error_string += makeError('email', $('#openrush_email').val())
        error_string += makeError('phone', $('#openrush_phone').val())
        error_string += makeError('residence', $('#openrush_residence').val())
        error_string += makeError('year', $('#openrush_year').val())
        error_string += makeError('photo', $('#openrush_photo').val())

        if error_string.length > 0
            alert error_string
        else
            #submit!
            $('.new_openrush').submit()
            $('.thankyou').show()
            timer = setTimeout(clearForm, 3000)


    cleanInput = (input) ->
        input = $.trim(input)
        input = input.replace(/\s+/g, " ")
        return input

    makeError = (field, value) ->
        if value.length is 0
            return field + ' is missing. '
        else
            return ''


    clearForm = () ->
        $('#openrush_name').val('')
        $('#openrush_email').val('')
        $('#openrush_phone').val('')
        $('#openrush_residence').val('')
        $('#openrush_year').val('')
        $('#openrush_photo').val('')
        $('.demo-photo').hide()
        $('.photo-taken').hide()
        $('.photo-button').val('Take a photo')
        clearTimeout(timer)
        $('.thankyou').fadeOut()

    $('.next_signin').live 'click', () ->
        clearForm()
        