App.EditVerseView = Ember.View.extend
  verseBinding: 'App.selectedVerseController.verse'
  tagName: 'form'
  templateName: 'app/templates/verses/edit'

  didInsertElement: ->
    @transaction = App.store.transaction()
    @transaction.add(@get "verse")

    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @transaction.rollback()
    @get("parentView").hideEdit()

  submit: (event) ->
    verse = @get "verse"
    validationErrors = verse.validate()

    event.preventDefault()

    if validationErrors is not undefined
      App.displayError(validationErrors)
    else
      @transaction.commit() #TODO: error handling
      @get("parentView").hideEdit()
