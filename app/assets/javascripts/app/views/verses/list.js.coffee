App.ListVersesView = Ember.View.extend
  templateName: 'app/templates/verses/list'
  versesBinding: 'App.versesController'
  
  showNew: ->
    @set 'isNewVisible', true

  hideNew: ->
    @set 'isNewVisible', false

  refreshListing: ->
    App.versesController.findAll()
