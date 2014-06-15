# Public: Displays a message in the status bar.
module.exports =
class StatusMessage
  # Public: Displays `message` in the status bar.
  #
  # If the status bar does not exist for whatever reason, no message is
  # displayed and no error occurs.
  #
  # message - A {String} containing the message to display.
  constructor: (message) ->
    @statusBar = atom.workspaceView.statusBar

    if @statusBar?
      @panel = @statusBar.appendLeft("<div class=\"inline-block\">#{message}</div>")
      @node = @panel.element.lastChild

  # Public: Removes the message from the status bar.
  remove: ->
    @panel.element.removeChild(@node) if @statusBar?

  # Public: Updates the text of the message.
  #
  # text - A {String} containing the new message to display.
  setText: (text) ->
    @node.innerHTML = text if @statusBar?
