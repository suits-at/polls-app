Meteor.publish 'allPolls', ->
  return Polls.find()

Meteor.publish 'singlePoll', ->
  return Polls.find(_id: pollId)
