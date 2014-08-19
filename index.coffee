path  = require 'path'
donna = require 'donna'
tello = require 'tello'

module.exports = (grunt) ->
  grunt.registerTask 'atomdoc', 'Generate an atomdoc api.json file', ->
    rootPath = path.resolve('.')
    outputPath = path.resolve('api.json')

    metadata = donna.generateMetadata([rootPath])
    digestedMetadata = tello.digest(metadata)
    api = JSON.stringify(digestedMetadata, null, 2)
    grunt.file.write(outputPath, api)
