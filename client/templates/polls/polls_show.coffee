Template.polls_share.helpers
  path_polls_index: -> FlowRouter.path 'polls_index'

Template.polls_share.onCreated ->
  Vue.config.delimiters = [
    '[['
    ']]'
  ]
  @autorun =>
    @subscribe('allPolls')

Template.polls_share.onRendered ->
  new Vue {
    el: '[vue=polls_share]'
    data:
      poll: {}
      pollId: FlowRouter.getParam('pollId')
    created: ->
      @subscriptionPoll = Meteor.subscribe('singlePoll', @pollId)
      Tracker.autorun =>
        @poll = Polls.findOne(@pollId)
  }

