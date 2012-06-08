App.NewVerseView = Ember.View.extend
  tagName: 'form'
  templateName: 'app/templates/verses/edit'

  init: ->
    @set "verse", App.Verse.create()
    @_supper()

  # ??
  didInsertElement: ->
    @_supper()
    @$('input:first').focus()

  cancelForm: ->
    @get("parentView").hideNew()

  submit: (event) ->
    verse = @get "verse"

    event.preventDefault()

    verse.save()
      .fail (e) ->
        App.displayError(e)
      .done =>
        App.versesController.pushObject(verse)
        @get("parentView").hideNew()
