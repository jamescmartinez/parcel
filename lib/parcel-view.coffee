{View} = require 'atom'

module.exports =
class ParcelView extends View
  @content: ->
    @div class: 'parcel overlay from-top', =>
      @div "The Parcel package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "parcel:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "ParcelView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
