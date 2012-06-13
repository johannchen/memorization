App.VerseTitleView = Ember.View.extend
  templateName: 'app/templates/verses/title'
  classNameBindings: ['isSelected']

  click: ->
    verse = @get 'verse'
    App.selectedVerseController.set 'verse', verse
