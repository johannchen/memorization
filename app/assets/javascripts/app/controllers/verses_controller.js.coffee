App.versesController = Ember.ArrayController.create
  content: App.store.findAll App.Verse, (a, b) ->
    b.get("memorized") - a.get("memorized")

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
      sortedVerses = @get("content").orderBy('memorized DESC')
    else
      sortedVerses = @get("content").orderBy('memorized ASC')
      #sortedVerses = @get("content").sort((a, b) ->
      #  b.get("memorized") - a.get("memorized")
      #)

    @set "content", []
    @set "content", sortedVerses
