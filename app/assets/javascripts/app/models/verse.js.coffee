App.Verse = Ember.Resource.extend
  url: '/verses'
  name: 'verse'
  properties: ['title', 'content']
