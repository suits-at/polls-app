Meteor.publish 'allProjects', ->
  return Projects.find()

Meteor.publish 'allPolls', ->
  return Polls.find()
