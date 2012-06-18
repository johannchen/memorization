App.Verse = Ember.Resource.extend
  resourceUrl: '/verses'
  resourceName: 'verse'
  resourceProperties: ['title', 'content', 'memorized']
