Template.projects_index.onCreated ->
  @autorun =>
    @subscribe('allProjects')


Template.projects_index.helpers
  path_projects_create: -> FlowRouter.path 'projects_create'

Template.projects_index.onRendered ->
  new Vue {
    el: '#projects_list'
    methods:
      doStuff: (projectId) ->
        alert "Project id = #{projectId}"
    sync:
      projects: ->
        return Projects.find {}, {sort: {createdAt: -1}}
  }

Template.projects_create.onRendered ->
  vm = new Vue {
    el: '#projects_create_form'
    data:
      title: ''
    methods:
      submit: (e) ->
        if @title
          project = new Project {
            title: @title
          }
          if project.validate()
            project.save()
            FlowRouter.go('projects_index')
#          Meteor.call 'projectInsert', project, (error, result) ->
#            if error
#              return alert error.reason
#            else
#              FlowRouter.go 'projects_index'

        else
          alert 'Title can\'t be empty!'
  }

# Template.projects_create.onRendered ->
#   template = @
#   vm = new Vue {
#     el: '#projects_create_form'
#     data:
#       title: ''
#     methods:
#       submit: (e) ->
#         e.preventDefault()
#         if this.title
#           entry = {
#             title: this.title
#             createdAt: new Date()
#           }
#
#           Projects.insert entry
#           FlowRouter.go 'projects_index'
#         else
#           alert 'Title can\'t be empty!'
#   }
