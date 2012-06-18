App.MemorizeVerseView = Ember.View.extend
  templateName: 'app/templates/verses/memorize'

  init: ->
    memorizeVerse = App.Verse.create @get('parentView').get('verse')
    @set 'verse', memorizeVerse
    @set 'typedContent', null
    @_super()

  showResult: ->
    @set 'showResult', true

  submit: (event) ->
    event.preventDefault()
    @showResult()

    # compare verses if matched, memorized

