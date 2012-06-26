#App.Verse = Ember.Resource.extend
#  resourceUrl: '/verses'
#  resourceName: 'verse'
#  resourceProperties: ['title', 'content', 'memorized']

App.Verse = DS.Model.extend
  title: DS.attr("string")
  content: DS.attr("string")
  memorized: DS.attr("number")

  isMemorized: Ember.computed(->
    if @get('memorized') > 0 then true else false
  ).property('memorized')
