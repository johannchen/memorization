App.ShowVerseView = Ember.View.extend
  templateName: 'app/templates/verses/show'

  doubleClick: ->
    @showEdit()

  showEdit: ->
    @set 'isEditing', true

  hideEdit: ->
    @set 'isEditing', false

  destroyRecord: ->
    verse = @get "verse"

    verse.destroyResource()
      .fail (e) ->
        App.displayError(e)
      .done ->
        App.versesController.removeObject verse
