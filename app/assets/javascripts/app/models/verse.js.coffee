App.Verse = Ember.Resource.extend
  resourceUrl: '/verses'
  resourceName: 'verse'
  resourceProperties: ['title', 'content', 'memorized']
  isMemorized: Ember.computed(->
    if @get('memorized') > 0 then true else false
  ).property('memorized')
