@IndexCtrl = ($scope, $location, tarefaData, $routeParams) ->
  $scope.title = "To do list"

  $scope.add = ->
    $location.url("/addTarefa")

  $scope.data = tarefaData.data

  tarefaData.loadTarefas()

@IndexCtrl.$inject = ['$scope', '$routeParams', 'tarefaData']