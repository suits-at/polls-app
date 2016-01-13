Template.userview_polls.onCreated ->
  @autorun =>
    @subscribe('allPolls')



Template.userview_polls.helpers
  path_polls_index: -> FlowRouter.path 'polls_index'
  poll: ->
    return Polls.findOne(FlowRouter.getParam('pollId'))


#Template.userview_polls.event ->
#  'load .option' ->
#    console.log $('input[class^="option"]').length;



Template.userview_polls.onRendered ->
  this.autorun =>
    Meteor.subscribe 'allPolls', {
      onReady: =>
        this.$('input.option').first().prop('checked', true)
    }

  new Vue {
    el: '#polls_vote_form'
    data:
      pollvoter: ''
    methods:
      ready: ->
        $('input[class^="option"]:first').attr('checked', true)
      created: ->
        $('input[class^="option"]:first').attr('checked', true)


      submit: (e) ->
        e.preventDefault()
        if @pollvoter
          poll = Polls.findOne(FlowRouter.getParam('pollId'))
          pollvoter = @pollvoter
          $opt = $('input[class^="option"]')
          selectedOpt = $opt.index($opt.filter(':checked'))
          counter = poll.options_poll[selectedOpt].optioncount+1


          poll.options_poll[selectedOpt].push 'persons', pollvoter
          poll.options_poll[selectedOpt].set 'optioncount', counter

          if poll.validate()
            poll.save()
            FlowRouter.go('/polls/diagram/'+FlowRouter.getParam('pollId'))
#            FlowRouter.go('userview_diagram')

        else
          alert 'Your name can\'t be empty!'
  }
  return
