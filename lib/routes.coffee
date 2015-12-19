FlowRouter.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'mainLayout'

#
# Routes for Polls
#
FlowRouter.route '/polls',
  name: 'polls_index'
  action: ->
    BlazeLayout.render 'mainLayout', {content: 'polls_index'}

FlowRouter.route '/polls/new',
  name: 'polls_create'
  action: ->
    BlazeLayout.render 'mainLayout', {content: 'polls_create'}