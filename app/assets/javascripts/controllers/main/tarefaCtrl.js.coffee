@TarefaCtrl = ($scope, $location, tarefaData) ->
  $scope.tarefa =
    tarefaTitulo: ""
    tarefaDescricao: ""
    tarefaData: ""

  $scope.addTarefa = ->
    tarefaData.createTarefa($scope.tarefa)
    $location.url("/")

@TarefaCtrl.$inject = ['$scope', '$location', 'tarefaData']
  

