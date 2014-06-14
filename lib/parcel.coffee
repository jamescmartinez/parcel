ParcelView = require './parcel-view'

module.exports =
  parcelView: null

  activate: (state) ->
    @parcelView = new ParcelView(state.parcelViewState)

  deactivate: ->
    @parcelView.destroy()

  serialize: ->
    parcelViewState: @parcelView.serialize()
