@IndexCtrl = ($scope, $location, tarefaData, $routeParams) ->
  $scope.data = tarefaData.data

  tarefaData.loadTarefas()

  
  $scope.converteData = (n,m) ->
    text = ""
    text += n
    text += m
    if(text == "01")
        $scope.mes = "Jan"
    if(text == "02")
        $scope.mes = "Fev"
    if(text == "03")
        $scope.mes = "Mar"
    if(text == "04")
        $scope.mes = "Abr"
    if(text == "05")
        $scope.mes = "Mai"
    if(text == "06")
        $scope.mes = "Jun"
    if(text == "07")
        $scope.mes = "Jul"
    if(text == "08")
        $scope.mes = "Ago"
    if(text == "09")
        $scope.mes = "Set"
    if(text == "10")
        $scope.mes = "Out"
    if(text == "11")
        $scope.mes = "Nov"
    if(text == "12")
        $scope.mes = "Dez"

  $scope.addTarefa = ->
    $location.url("/addTarefa")

  $scope.excluirTarefa = (tarefa) ->
    console.log(tarefa.id)
    tarefaData.excluirTarefa(tarefa.id)



@IndexCtrl.$inject = ['$scope', '$location', 'tarefaData', '$routeParams']