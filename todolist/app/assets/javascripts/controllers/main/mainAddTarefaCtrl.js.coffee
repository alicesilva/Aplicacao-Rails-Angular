@TarefaCtrl = ($scope, $location, tarefaData) ->
  $scope.title = "Oi"

  $scope.formData =
    newTarefaTitulo: ''
    newTarefaNota: ''

  $scope.createTarefa = ->
    tarefaData.createTarefa($scope.formData)

@TarefaCtrl.$inject = ['$scope', '$location', 'tarefaData']