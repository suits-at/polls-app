Meteor.publish 'allPolls', ->
  return Polls.find()