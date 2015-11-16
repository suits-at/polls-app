@Projects = new Mongo.Collection 'projects'

@Project = Astro.Class {
  name: 'Project'
  collection: Projects
  fields:
    title: 'string'
    createdAt:
      type: 'date'
      default: -> new Date
    updatedAt:
      type: 'date'
      default: -> new Date
}