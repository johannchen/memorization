App.EditVerseView = Ember.View.extend
  tagName: 'form'
  templateName: 'app/templates/verses/edit'

  init: ->
    # creat a new verse that's a duplicate of the verse in the parentView;
    # change made to the duplicate won't be applied to the orginal unless
    # everything goes well in submitForm
    editableVerse = App.Verse.create this.get('parentView').get('verse')
    @set "verse", editableVerse
    @_super()

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @get("parentView").hideEdit()

  submit: (event) ->
    verse = @get "verse"

    event.preventDefault()

    verse.saveResource()
      .fail (e) ->
        App.displayError(e)
      .done =>
        parentView = @get("parentView")
        parentView.get("verse").duplicateProperties(verse)
        parentView.hideEdit()
