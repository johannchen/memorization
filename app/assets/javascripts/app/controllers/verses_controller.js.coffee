App.versesController = Ember.ResourceController.create
  resourceType: App.Verse
  #insert verse to the top of the list 
  add: (verse) ->
    @insertAt(0, verse)
