if Meteor.isClient
  # Listen to changes in the Messages collection
  Meteor.subscribe 'messages'
else
  # Pushes changes to the Messages collection
  Meteor.publish 'messages', =>
    return @Messages.find()

@Messages = new Meteor.Collection 'messages'

# This code is sent to the client, but doesn't do anything malicious if executed there
if Meteor.isServer
  Meteor.methods
    # Called from the client to add a new message using the right user
    send: (message) =>
      user = Meteor.user()

      # In case someone manages to call this without being logged in
      if not user
        throw new Meteor.Error 401, "You need to login to chat!"

      # Don't send empty messages
      if not message.text
        throw new Meteor.Error 422, "Cannot send blank messages."

      # Figure out of they have a username, email address or Facebook name
      if user.username or user.emails
        name = user.username or user.emails[0].address
      else
        name = user.profile.name

      message.name = name

      return @Messages.insert message