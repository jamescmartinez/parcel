{WorkspaceView} = require 'atom'
Parcel = require '../lib/parcel'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Parcel", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('parcel')

  describe "when the parcel:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.parcel')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'parcel:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.parcel')).toExist()
        atom.workspaceView.trigger 'parcel:toggle'
        expect(atom.workspaceView.find('.parcel')).not.toExist()
