App = Ember.Application.create()

App.router = App.Router.create
  location: 'hash'
  root: Ember.State.extend
    index: Ember.State.extend
      route: '/'
      redirectsTo: 'verses'
    verses: Ember.State.extend
      route: '/verses'
      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet App.VersesView, App.Verse.find()
    verse: Ember.State.extend
      route: '/verses/:verse_id'

App.initialize(App.router)

