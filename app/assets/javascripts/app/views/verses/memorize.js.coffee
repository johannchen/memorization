App.MemorizeVerseView = Ember.View.extend
  verseBinding: 'App.selectedVerseController.verse'
  templateName: 'app/templates/verses/memorize'

  init: ->
    @set 'typedContent', null
    @_super()

  didInsertElement: ->
    @transaction = App.store.transaction()
    @transaction.add(@get "verse")
    @_super()
    @$('textarea').focus()

  review: ->
    @get('parentView').hideMemorize()

  reset: ->
    $('#diff-result').empty()

  submit: (event) ->
    event.preventDefault()
    verse = @get 'verse'
    typedContent = @get 'typedContent'
    verseContent = verse.get("content")
    if typedContent is verseContent
      # mark memorized
      $('#diff-result').html("Yay! You have memorized this verse!")
      memorized = verse.get("memorized") + 1
      verse.set "memorized", memorized
      @transaction.commit() #TODO: error handling

      parentView = @get("parentView")
      parentView.get("verse").duplicateProperties(verse)
    else
      dmp = new diff_match_patch()
      d = dmp.diff_main(typedContent, verseContent)
      dmp.diff_cleanupSemantic(d)
      ds = dmp.diff_prettyHtml(d)
      $('#diff-result').html(ds)

