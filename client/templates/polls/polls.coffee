Template.polls_index.onCreated ->
  @autorun =>
    @subscribe('allPolls')


Template.polls_index.helpers
  path_polls_create: -> FlowRouter.path 'polls_create'

Template.polls_index.onRendered ->
  new Vue {
    el: '#polls_list'
    data:
      polls: []
      loader: true
    ready: ->
      @loader = false
    created: ->
      @subscription = Meteor.subscribe('allPolls')
      Tracker.autorun =>
        @polls = Polls.find({}, sort: createdAt: -1).fetch()
    methods:
      doStuff: (pollsId) ->
        alert "Polls id = #{pollsId}"
  }

Template.polls_create.onRendered ->
  vm = new Vue {
    el: '#polls_create_form'
    data:
      title: ''
      description: ''
    methods:
      submit: (e) ->
        if @title
          poll = new Poll {
            title: @title
            description: @description
            duration: @duration
          }
          poll.push 'options_poll', optiontitle: @option1
          poll.push 'options_poll', optiontitle: @option2

          if poll.validate()
            poll.save()
            FlowRouter.go('polls_index')
#          Meteor.call 'pollInsert', poll, (error, result) ->
#            if error
#              return alert error.reason
#            else
#              FlowRouter.go 'polls_index'

        else
          alert 'Title can\'t be empty!'
  }