// Generated by CoffeeScript 1.6.3
(function() {
  var _this = this;

  Template.chat.helpers({
    messages: function() {
      return this.Messages.find();
    }
  });

  Template.chat.events({
    'submit form': function(event) {
      var message;
      event.preventDefault();
      message = {
        text: $(event.target).find('[name=input]').val()
      };
      Meteor.call('send', message);
      return $(event.target).find('[name=input]').val('');
    }
  });

}).call(this);

/*
//@ sourceMappingURL=chat.map
*/
