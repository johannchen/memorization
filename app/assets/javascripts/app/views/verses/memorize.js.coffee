App.MemorizeVerseView = Ember.View.extend
  verseBinding: 'App.selectedVerseController.verse'
  templateName: 'app/templates/verses/memorize'

  init: ->
    @set 'typedContent', null
    @_super()

  review: ->
    @get('parentView').hideMemorize()

  reset: ->
    $('#diff-result').empty()

  submit: (event) ->
    event.preventDefault()
    typedContent = @get 'typedContent'
    verse = App.Verse.create @get 'verse'
    if typedContent is verse.content
      # mark memorized
      $('#diff-result').html("Yay! You have memorized this verse!")
      verse.memorized = true
      verse.saveResource()
        .fail (e) ->
          App.displayError(e)
        .done =>
          parentView = @get("parentView")
          parentView.get("verse").duplicateProperties(verse)
    else
      dmp = new diff_match_patch()
      d = dmp.diff_main(typedContent, verse.content)
      ds = dmp.diff_prettyHtml(d)
      $('#diff-result').html(ds)

