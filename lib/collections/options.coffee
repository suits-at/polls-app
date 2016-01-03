@Options = new Mongo.Collection 'options'

@Option = Astro.Class {
  name: 'Option'
  collection: Options
  fields:
    optiontitle:
      type: 'string'
      default: 'Default Option'
    optioncount:
      type: 'number'
      default: '0'
    createdOptAt:
      type: 'date'
      immutable: true
      default: -> new Date
    persons:
      type: 'array'
      default: -> []
   methods:
    created: ->
    	moment(@createdOptAt).format 'DD.MM.YYYY'
}
