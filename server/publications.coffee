Meteor.publish 'allProjects', ->
  return Projects.find()
