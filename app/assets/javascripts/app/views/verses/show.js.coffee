App.ShowVerseView = Ember.View.extend
  verseBinding: 'App.selectedVerseController.verse'
  templateName: 'app/templates/verses/show'
  classNames: ['card']

  doubleClick: ->
    @showEdit()

  showEdit: ->
    @set 'isEditing', true

  hideEdit: ->
    @set 'isEditing', false

  showMemorize: ->
    @set 'isMemorizing', true

  hideMemorize: ->
    @set 'isMemorizing', false

  confirmRemove: ->
    @destroyRecord() if confirm("Confirm Remove?")

  destroyRecord: ->
    verse = @get "verse"

    verse.destroyResource()
      .fail (e) ->
        App.displayError(e)
      .done ->
        App.versesController.removeObject verse
        App.selectedVerseController.set 'verse', null
