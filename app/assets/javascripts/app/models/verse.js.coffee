#App.Verse = Ember.Resource.extend
#  resourceUrl: '/verses'
#  resourceName: 'verse'
#  resourceProperties: ['title', 'content', 'memorized']

App.Verse = DS.Model.extend
  title: DS.attr("string")
  content: DS.attr("string")
  memorized: DS.attr("number")

  validate: ->
    if @get("title") is "" or @get("content") is ""
      "Verse require a title and content"
  
  isMemorized: Ember.computed(->
    if @get('memorized') > 0 then true else false
  ).property('memorized')

App.Verse.reopenClass
  url: 'verse'
