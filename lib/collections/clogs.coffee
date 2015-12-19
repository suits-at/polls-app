Clogs = new (Mongo.Collection)('clogs')
Clog = Astro.Class(
  name: 'Clog'
  collection: Clogs
  fields:
    body: 'string'
    projectId:
      type: 'string'
      required: true
    createdAt:
      type: 'date'
      default: ->
        new Date
      immutable: true
    updatedAt:
      type: 'date'
      default: ->
        new Date
  methods:
    created: ->
      moment(@createdAt).format 'DD/MM/YYYY'
    updated: ->
      moment(@updatedAt).fromNow()
  events:
    'beforeUpdate': ->
      @set 'updatedAt', new Date
)