Super Development Log
=====================

References:

- https://github.com/niallobrien/meteor-vue-example
- https://github.com/kadirahq/flow-router

Install Meteor (meteor.com) For Guide
Created new Meteor Project

```shell
$ meteor create logapp
```

- Investigate exisiting Files (How does it work)
- DELETE Files

Install Packages We Need
```shell
$ meteor add coffeescript
$ meteor add kadira:flow-router
$ meteor add kadira:blaze-layout
$ meteor add vue:vue
$ meteor add erasaur:meteor-lodash
```

---

### Create Folder Structure

| public
| lib
| client
| - lib
| - templates
|   | main
| server

### Create First View

Path:
`client/lib/main/main.html`

Get's loaded after Starting the Server. Will show content!
When wrapping everything into a <template> tag it will disappear.

Need to create Routes.

### Create First Routes

Path:
`lib/routes.coffee`

```coffee
FlowRouter.route '/',
  name: 'home'
  action: ->
    BlazeLayout.render 'mainLayout'
```

Create new Views and link to those views:

projects_index, projects_create, ...

### Put Vue into the mix

```coffee
Template.xxx.onRendered ->
  vm = new Vue {
    el: '#el'
    data:
      title: ''
    methods:
      submit: (e) ->
        e.preventDefault()
        if this.title
          alert 'Save this Project.'
        else
          alert 'Title can\'t be empty!'
  }
```

### Collections

Create file in `lib/collections/`

```coffee
@Projects = new Mongo.Collection 'projects'
```

```coffee
entry = {
  title: this.title
  createdAt: new Date()
}

Projects.insert entry
```

```html
{{#each projects}}
  <p>
    {{ title }}
  </p>
{{/each}}
```

```coffee
projects: ->
  return Projects.find {}, {sort: {createdAt: -1}}
```

### Autopublish Remove

```bash
$ meteor remove autopublish
```

```coffee
Meteor.publish 'allProjects', ->
  return Projects.find()
```

```coffee
Template.projects_index.onCreated ->
  @autorun =>
    @subscribe('allProjects')
```

### Adding New Entries To DB

After being subscribed to this collection we can also add new Projects.

Encorporate this into the VueModel

```coffee
entry = {
  title: this.title
  createdAt: new Date()
}

Projects.insert entry
```

When opening this in multiple browsers you'll see Reactivity in Action.

### Adding Methods

We can use methods that take care of adding entries into the database
Create new file in `lib/methods/projects.coffee` and add new method.

```coffee
Meteor.methods
  projectInsert: (postAttributes) ->
    check postAttributes,
      title: String

    projectEntry = _.extend postAttributes,
      createdAt: new Date()
      updatedAt: new Date()

    projectId = Projects.insert projectEntry

    return _id: projectId
```
