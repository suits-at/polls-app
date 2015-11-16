FlowRouter.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'mainLayout'

FlowRouter.route '/projects',
  name: 'projects_index'
  action: ->
    BlazeLayout.render 'mainLayout', { content: 'projects_index' }

FlowRouter.route '/projects/new',
  name: 'projects_create'
  action: ->
    BlazeLayout.render 'mainLayout', { content: 'projects_create' }
