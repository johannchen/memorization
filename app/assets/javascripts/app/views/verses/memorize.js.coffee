App.MemorizeVerseView = Ember.View.extend
  templateName: 'app/templates/verses/memorize'

  init: ->
    memorizeVerse = App.Verse.create @get('parentView').get('verse')
    @set 'verse', memorizeVerse
    @set 'typedContent', null
    @_super()

  reset: ->
    $('#diff-result').empty()

  submit: (event) ->
    event.preventDefault()
    typedContent = @get 'typedContent'
    memorizeVerse = @get 'verse'
    if typedContent is memorizeVerse.content
      # mark memorized
      $('#diff-result').html("You have memorized this verse!")
      memorizeVerse.memorized = true
      memorizeVerse.saveResource()
        .fail (e) ->
          App.displayError(e)
        .done =>
          parentView = @get("parentView")
          parentView.get("verse").duplicateProperties(memorizeVerse)
    else
      dmp = new diff_match_patch()
      d = dmp.diff_main(typedContent, memorizeVerse.content)
      ds = dmp.diff_prettyHtml(d)
      $('#diff-result').html(ds)

