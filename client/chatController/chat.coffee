# A function that can be called from the "chat" template
Template.chat.helpers
  messages: ->
    # find() returns all Messages in the collection
    return @Messages.find()

# Event handlers
Template.chat.events
  'submit form': (event) =>
    # Stops the form from changing the page's location
    event.preventDefault()

    # An object that gets passed to the server
    message =
      text: $(event.target).find('[name=input]').val()

    # Server side method that controls post insertions
    Meteor.call 'send', message

    # This just clears the input box
    $(event.target).find('[name=input]').val('')
