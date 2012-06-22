App.ListVersesView = Ember.View.extend
  templateName: 'app/templates/verses/list'
  versesBinding: 'App.versesController'
  
  showNew: ->
    @set 'isNewVisible', true

  hideNew: ->
    @set 'isNewVisible', false

  sortMemorized: ->
    @get('verses').sortVerses()

  # TODO: refresh does not work #
  # refreshListing: ->
  #  App.versesController.findAll()
