@TarefaCtrl = ($scope, $location, tarefaData) ->
  $scope.tarefa =
    tarefaTitulo: ""
    tarefaDescricao: ""
    tarefaData: ""

  $scope.addTarefa = ->
    tarefaData.createTarefa($scope.tarefa)
    $location.url("/")
    location.reload();

@TarefaCtrl.$inject = ['$scope', '$location', 'tarefaData']
  

