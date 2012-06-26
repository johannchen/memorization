window.App = Ember.Application.create()

App.store = DS.Store.create
  revision: 4
  adapter: DS.RESTAdapter.create(bulkCommit: false)

App.displayError = (e) ->
  if typeof e is 'string'
    alert e
  else if typeof e is 'object' and e.responseText?
    alert e.responseText
  else
    alert "An unexpected error occurred."
