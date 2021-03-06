# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./services/main
#= require_tree ./controllers/main
TarefasList = angular.module('TarefasList', [])

# Sets up routing
TarefasList.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post'
  $routeProvider.when('/addTarefa', { templateUrl: '../assets/templates/addTarefa.html', controller: 'TarefaCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/templates/mainIndex.html', controller: 'IndexCtrl' } )

])

