@TarefaCtrl = ($scope, $location, tarefaData) ->
  $scope.title = "Oi"

  $scope.formData =
    newTarefaTitulo: ''
    newTarefaNota: ''
    newTarefaData: ''
    
  $scope.createTarefa = ->
    tarefaData.createTarefa($scope.formData)

@TarefaCtrl.$inject = ['$scope', '$location', 'tarefaData']