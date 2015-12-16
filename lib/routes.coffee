FlowRouter.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'mainLayout'

#
# Routes for Projects
#
FlowRouter.route '/projects',
  name: 'projects_index'
  action: ->
    BlazeLayout.render 'mainLayout', { content: 'projects_index' }

FlowRouter.route '/projects/new',
  name: 'projects_create'
  action: ->
    BlazeLayout.render 'mainLayout', { content: 'projects_create' }

#
# Routes for Polls
#
FlowRouter.route '/polls',
  name: 'polls_index'
  action: ->
    BlazeLayout.render 'mainLayout', { content: 'polls_index' }

FlowRouter.route '/polls/new',
  name: 'polls_create'
  action: ->
    BlazeLayout.render 'mainLayout', { content: 'polls_create' }