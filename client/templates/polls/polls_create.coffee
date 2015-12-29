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
    duration: ->
      @subscription = Meteor.subscribe('allPolls')
    methods:
      doStuff: (pollId) ->
        alert "Polls id = #{pollId}"
  }

Template.polls_create.onRendered ->
  vm = new Vue {
    el: '#polls_create_form'
    data:
      title: ''
      description: ''
      duration: ''
      charttype: ''
      options_poll: ''
    methods:
      submit: (e) ->
        if @title
          poll = new Poll {
            title: @title
            description: @description
            duration: @duration
            charttype: @charttype
          }
          $opt = $('input[class^="option"]')

          $.each $opt, (index, v) ->
            poll.push 'options_poll', optiontitle: $opt[index].value

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

Template.polls_create.events 'click #addOption': ->
  $('#optionDiv').append '<input type="text" placeholder="option" autofocus class="option"><br />'

Template.polls_create.helpers
  path_polls_index: -> FlowRouter.path 'polls_index'
