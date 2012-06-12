App.NewVerseView = Ember.View.extend
  tagName: 'form'
  templateName: 'app/templates/verses/edit'

  init: ->
    @set "verse", App.Verse.create()
    @_super()

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @get("parentView").hideNew()

  submit: (event) ->
    verse = @get "verse"

    event.preventDefault()

    verse.saveResource()
      .fail (e) ->
        App.displayError(e)
      .done =>
        App.versesController.pushObject(verse)
        @get("parentView").hideNew()