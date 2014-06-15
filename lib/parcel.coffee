PackageSync = null
packageSync = null

loadModule = ->
  PackageSync ?= require './package-sync'
  packageSync ?= new PackageSync()

# Register commands to be accessed by the menu and the Command Palette.
module.exports =
  activate: ->
    atom.workspaceView.command 'parcel:sync', ->
      loadModule()
      packageSync.sync()
