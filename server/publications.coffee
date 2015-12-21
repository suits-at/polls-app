Meteor.publish 'allPolls', ->
  return Polls.find()

Meteor.publish 'allClogs', (projectId) ->
  if projectId
    return Clogs.find(projectId: projectId)
  return

Meteor.publish 'singlePoll', ->
  return Poll.find(_id: pollsId)