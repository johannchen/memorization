App.versesController = Ember.ResourceController.create
  resourceType: App.Verse
  #insert verse to the top of the list 
  add: (verse) ->
    @insertAt(0, verse)

  sort: "desc"
  sortVerses: ->
    if @get("sort") is "desc"
      @set "sort", "asc"
    else
      @set "sort", "desc"

    if @get("sort") is "asc"
      sortedVerses = @get("content").sort((a, b) ->
        a.get("memorized") - b.get("memorized")
      )
    else
      sortedVerses = @get("content").sort((a, b) ->
        b.get("memorized") - a.get("memorized")
      )

    @set "content", []
    @set "content", sortedVerses
