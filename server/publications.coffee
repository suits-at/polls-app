Meteor.publish 'allProjects', ->
  return Projects.find()

Meteor.publish 'allPolls', ->
  return Polls.find()

Meteor.publish 'allClogs', (projectId) ->
  if projectId
    return Clogs.find(projectId: projectId)
  return