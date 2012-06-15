App.MemorizeVerseView = Ember.View.extend
  templateName: 'app/templates/verses/memorize'

  init: ->
    memorizeVerse = App.Verse.create @get('parentView').get('verse')
    @set 'verse', memorizeVerse
    @_super()
