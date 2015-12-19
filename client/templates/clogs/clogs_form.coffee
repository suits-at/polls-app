# -------------------------------
# Clogs Form
# -------------------------------
Template.clogs_form.onRendered ->
  new Vue(
    el: '[vue=clogs_form]'
    data: clog: new Clog
    methods: submit: ->
      if !@clog.body
        return alert('Body can\'t be blank!')
      @clog.set 'body', @clog.body
      @clog.set 'projectId', FlowRouter.getParam('projectId')
      if !@clog.validate()
        return alert('Validation Error!')
      @clog.save()
      @clog = new Clog
      return
  )
  # Vue
  return