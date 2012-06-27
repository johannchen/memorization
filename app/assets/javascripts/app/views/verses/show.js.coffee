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
    App.selectedVerseController.set 'isMemorizing', true

  hideMemorize: ->
    App.selectedVerseController.set 'isMemorizing', false 

  confirmRemove: ->
    @destroyRecord() if confirm("Confirm Remove?")

  destroyRecord: ->
    verse = @get "verse"
    verse.deleteRecord()
    App.store.commit()
    App.selectedVerseController.set 'verse', null
