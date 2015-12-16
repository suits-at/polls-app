@Polls = new Mongo.Collection 'polls'

@Poll = Astro.Class {
  name: 'Poll'
  collection: Polls
  fields:
    title: 'string'
    description: 'string'
    charttype: 'number'
    options_poll:
      type: 'array'
      nested: 'Option'
      default: -> []
    duration: 
      type: 'date'
      default: -> new Date
    createdAt:
      type: 'date'
      immutable: true
      default: -> new Date
  methods:
    created: ->
      moment(@createdAt).format 'DD/MM/YYYY'
}