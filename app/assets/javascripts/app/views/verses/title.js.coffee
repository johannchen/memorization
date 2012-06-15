App.VerseTitleView = Ember.View.extend
  templateName: 'app/templates/verses/title'
  tagName: 'li'
  classNameBindings: ['isSelected']

  click: ->
    verse = @get 'verse'
    App.selectedVerseController.set 'verse', verse

  isSelected: Ember.computed(-> 
    selectedVerse = App.selectedVerseController.get 'verse'
    verse = @get 'verse'
    true if verse is selectedVerse
  ).property('App.selectedVerseController.verse')
