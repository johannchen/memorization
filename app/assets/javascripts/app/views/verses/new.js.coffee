App.NewVerseView = Ember.View.extend
  tagName: 'form'
  templateName: 'app/templates/verses/edit'

  init: ->
    @_super()
    @transaction = App.store.transaction()
    @set "verse", @transaction.createRecord(App.Verse, {})

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @transaction.rollback()
    @get("parentView").hideNew()

  submit: (event) ->
    verse = @get "verse"
    validationErrors = verse.validate()

    event.preventDefault()

    if validationErrors is not undefined
      App.displayError(validationErrors)
    else
      @transaction.commit()
      #TODO: insert on top
      App.versesController.add(verse)
      @get("parentView").hideNew()
      App.selectedVerseController.set 'verse', verse
