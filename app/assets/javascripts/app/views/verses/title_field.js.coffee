App.TitleFieldView = Ember.TextField.extend
  didInsertElement: ->
    $('#title').autocomplete source: App.bible.books
