pageSection = FlowRouter.group({})

pageSection.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'mainLayout'

pageSection.route '/mypolls',
  name: 'mypolls'
  action: ->
    BlazeLayout.render 'pollsLayout'

#
# Routes for Polls
#
pageSection.route '/polls',
  name: 'polls_index'
  action: ->
    BlazeLayout.render 'pollsLayout', {content: 'polls_index'}

pageSection.route '/polls/new',
  name: 'polls_create'
  action: ->
    BlazeLayout.render 'pollsLayout', {content: 'polls_create'}

pageSection.route '/polls/:pollId',
  name: 'polls_show'
  action: (params) ->
  	BlazeLayout.render 'pollsLayout', {content: 'polls_show'}

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
