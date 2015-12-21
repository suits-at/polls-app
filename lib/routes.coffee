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
    BlazeLayout.render 'mainLayout', {content: 'polls_index'}

pageSection.route '/polls/new',
  name: 'polls_create'
  action: ->
    BlazeLayout.render 'mainLayout', {content: 'polls_create'}

pageSection.route '/polls/:pollId',
  name: 'polls_show'
  action: (params) ->
  	BlazeLayout.render 'mainLayout', {content: 'polls_show'}