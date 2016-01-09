pageSection = FlowRouter.group({})

pageSection.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'mainLayout'

#
# Routes for Polls
#
pageSection.route '/polls',
  name: 'polls_index'
  action: ->
    if(Meteor.userId())
      BlazeLayout.render 'pollsLayout', {content: 'polls_index'}
    else
      FlowRouter.go('home');

pageSection.route '/polls/new',
  name: 'polls_create'
  action: ->
    BlazeLayout.render 'pollsLayout', {content: 'polls_create'}

pageSection.route '/polls/share/:pollId',
  name: 'polls_share'
  action: (params) ->
    BlazeLayout.render 'pollsLayout', {content: 'polls_share'}

pageSection.route '/polls/show/:pollId',
  name: 'userview_polls'
  action: (params) ->
    BlazeLayout.render 'pollsLayout', {content: 'userview_polls'}

pageSection.route '/polls/diagram/:pollId',
  name: 'userview_diagram'
  action: (params) ->
    BlazeLayout.render 'pollsLayout', {content: 'userview_diagram'}

pageSection.route '/polls/share',
  name: 'redirect'
  action: ->
    FlowRouter.go('polls_index');

if Meteor.isClient
  Accounts.onLogin ->
    FlowRouter.go 'polls_index'
    return
  Accounts.onLogout ->
    FlowRouter.go 'home'
    return
