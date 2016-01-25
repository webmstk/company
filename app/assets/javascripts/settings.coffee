ready = ->

  $('.add_subscriber').click (e) ->
    e.preventDefault()
    $('#subscriber_fields').html('<div class="form-group"><label>Email</label><input type="text" name="subscriber[email]"><a class="create_subscriber glyphicon glyphicon-floppy-disk" href="/subscribers"rel="nofollow"></a></div>')

  $('#new_subscriber button').click ->
    $('#subscriber_errors').empty()
    $('#new_subscriber').submit()

  $('#subscriber_email').click ->
    $('#subscriber_errors').empty()


$(document).ready(ready)