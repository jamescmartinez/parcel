PackageSync = null
packageSync = null

loadModule = ->
  PackageSync ?= require './package-sync'
  packageSync ?= new PackageSync()

installMissing = ->
  loadModule()
  packageSync.installMissing()

writePackageList = ->
  loadModule()
  packageSync.writePackageList()

module.exports =
  activate: ->
    # Register parcel:sync command to run installMissing()
    atom.workspaceView.command 'parcel:sync', ->
      installMissing()
    # Automatically run installMissing() when activated
    installMissing()
  deactivate: ->
    writePackageList()
