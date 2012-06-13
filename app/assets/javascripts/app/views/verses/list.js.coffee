App.ListVersesView = Ember.View.extend
  templateName: 'app/templates/verses/list'
  versesBinding: 'App.versesController'
  
  showNew: ->
    @set 'isNewVisible', true

  hideNew: ->
    @set 'isNewVisible', false

  showVerse: ->
    @set 'isShowVisible', true
  
  hideVerse: ->
    @set 'isShowVisible', false

  refreshListing: ->
    App.versesController.findAll()
