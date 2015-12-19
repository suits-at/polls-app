Template.mainLayout.onRendered ->
  Template.mainLayout.onCreated ->
  Vue.config.delimiters = [
    '[['
    ']]'
  ]
  return
Template.mainLayout.helpers
  path_polls_index: -> FlowRouter.path 'polls_index'