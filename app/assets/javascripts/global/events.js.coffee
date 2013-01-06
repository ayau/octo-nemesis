# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$ ->
    $(".datepicker").datepicker({
        dateFormat : "dd MM yy",
        buttonImageOnly : true,
        buttonImage : '/assets/iconDatePicker.png',
        showOn : "both",
        changeMonth : true,
        changeYear : true,
        yearRange : "c-20:c+5"  
    })

    $('.starttime').timepicker()
    $('.starttime').on 'changeTime', () ->
        $('.endtime').timepicker({'minTime': $(this).val(), 'durationTime': $(this).val(), 'showDuration': true})

    $('.endtime').timepicker({
        'minTime': $('.starttime').val()
        'durationTime': $('.starttime').val()
        'showDuration': true
    })

    $('.datepicker').keydown (e) ->
        return false