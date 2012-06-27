App.EditVerseView = Ember.View.extend
  verseBinding: 'App.selectedVerseController.verse'
  tagName: 'form'
  templateName: 'app/templates/verses/edit'

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @get("parentView").hideEdit()

  submit: (event) ->
    verse = @get "verse"
    validationErrors = verse.validate()

    event.preventDefault()

    if validationErrors is not undefined
      App.displayError(validationErrors)
    else
      editVerse = App.store.find(App.Verse, verse.id)
      editVerse.set "title", verse.title
      editVerse.set "content", verse.content
      App.store.commit()
      #TODO: bug list disappear
      parentView = @get("parentView")
      parentView.hideEdit()
