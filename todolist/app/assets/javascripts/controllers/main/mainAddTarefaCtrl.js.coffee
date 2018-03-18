@TarefaCtrl = ($scope, $location, tarefaData) ->

  $scope.formData =
    newTarefaTitulo: ''
    newTarefaNota: ''
    newTarefaData: ''
    
  $scope.createTarefa = ->
    tarefaData.createTarefa($scope.formData)
    $location.url("/")

@TarefaCtrl.$inject = ['$scope', '$location', 'tarefaData']