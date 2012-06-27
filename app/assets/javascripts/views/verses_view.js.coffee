App.VersesView= Ember.View.extend
  templateName: 'templates/verses'
  versesBinding: 'App.versesController'
  
  showNew: ->
    @set 'isNewVisible', true

  hideNew: ->
    @set 'isNewVisible', false

  sortMemorized: ->
    @get('verses').sortVerses()

  # TODO: refresh does not work #
  refreshListing: ->
    App.versesController.findAll()
