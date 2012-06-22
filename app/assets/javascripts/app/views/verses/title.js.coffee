App.VerseTitleView = Ember.View.extend
  templateName: 'app/templates/verses/title'
  tagName: 'li'
  classNameBindings: ['isSelected']

  click: ->
    verse = @get 'verse'
    App.selectedVerseController.set 'verse', verse
    #TODO: refresh memorize view
    if App.selectedVerseController.isMemorizing
      $("#diff-result").empty()
      $("form#memorize")[0].reset()

  #TODO: nav through keyboard
  keyUp: (evt) ->
    # up arrow
    alert("up key") if evt.keyCode is 38
    # down arrow
    alert("down key") if evt.keyCode is 40

  isSelected: Ember.computed(-> 
    selectedVerse = App.selectedVerseController.get 'verse'
    verse = @get 'verse'
    true if verse is selectedVerse
  ).property('App.selectedVerseController.verse')
