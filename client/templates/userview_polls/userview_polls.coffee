Template.userview_polls.onCreated ->
  @autorun =>
    @subscribe('allPolls')

Template.userview_polls.helpers
  path_polls_index: -> FlowRouter.path 'polls_index'

Template.userview_polls.onRendered ->
  new Vue {
    el: '#polls_vote_form'
    data:
      poll: {}
      pollId: FlowRouter.getParam('pollId')
      pollvoter: ''
    created: ->
      @subscriptionPoll = Meteor.subscribe('singlePoll', @pollId)
      Tracker.autorun =>
        @poll = Polls.findOne(@pollId)

    methods:
      submit: (e) ->
        e.preventDefault()
        if @pollvoter


          pollvoter: @pollvoter
          $opt = $('input[class^="option"]')
          selectedOpt = $opt.index($opt.filter(':checked'))
          console.log $opt
          alert selectedOpt

          poll.options_poll[selectedOpt].push 'persons', pollvoter
          poll.options_poll[selectedOpt].optioncount++

          if poll.validate()
            poll.save()
            FlowRouter.go('polls_index')

        else
          alert 'Your name can\'t be empty!'
  }
