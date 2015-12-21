Template.polls_show.onCreated ->
  @autorun =>
    @subscribe('allPolls')

Template.polls_show.onRendered ->
  new Vue {
    el: '[vue=polls_show]'
    data:
      poll: {}
      pollId: FlowRouter.getParam('pollId')
    created: ->
      @subscriptionPoll = Meteor.subscribe('singlePoll', @pollId)
      Tracker.autorun =>
        @poll = Polls.findOne(@pollId)
  }