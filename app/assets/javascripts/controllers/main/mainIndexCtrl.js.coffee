@IndexCtrl = ($scope, tarefaData, $location) ->
  $scope.title = "My blog"

  $scope.data = tarefaData.data

  tarefaData.loadTarefas()

  print = ->
    console.log($scope.data)

  print()

  
  $scope.converteData = (n,m) ->
    text = ""
    text += n
    text += m
    if(text == "01")
        $scope.mes = "janeiro"
    if(text == "02")
        $scope.mes = "fevereiro"
    if(text == "03")
        $scope.mes = "março"
    if(text == "04")
        $scope.mes = "abril"
    if(text == "05")
        $scope.mes = "maio"
    if(text == "06")
        $scope.mes = "junho"
    if(text == "07")
        $scope.mes = "julho"
    if(text == "08")
        $scope.mes = "agosto"
    if(text == "09")
        $scope.mes = "setembro"
    if(text == "10")
        $scope.mes = "outubro"
    if(text == "11")
        $scope.mes = "novembro"
    if(text == "12")
        $scope.mes = "dezembro"
  
  $scope.addTarefa = ->
    $location.path("/addTarefa")
  
  $scope.excluirTarefa = (tarefa) ->
    resposta = confirm("Tem certeza que deseja excluir a tarefa?")
    if(resposta == true)
      console.log(tarefa.id)
      tarefaData.excluirTarefa(tarefa)


@IndexCtrl.$inject = ['$scope', 'tarefaData', '$location']


