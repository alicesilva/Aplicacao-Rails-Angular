# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers/main
#= require_tree ./directives/main
#= require_tree ./filters/main
#= require_tree ./services/main

ToDo = angular.module('todolist', [])

ToDo.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post'
  $routeProvider.when('/addTarefa', { templateUrl: '../assets/addTarefa.html', controller: 'TarefaCtrl' } )
  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])

ToDo.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])