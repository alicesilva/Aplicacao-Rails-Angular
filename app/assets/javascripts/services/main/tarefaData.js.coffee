angular.module('TarefasList').factory('tarefaData', ['$http', '$location', ($http, $location) ->
  
  tarefaData =
    data:
      tarefas: [{titulo: '', nota: ''}]
    isLoaded: false

  tarefaData.loadTarefas = ->
    if !tarefaData.isLoaded
      $http.get('./tarefas.json').success( (data) ->
        tarefaData.data.tarefas = data
        tarefaData.isLoaded = true
        console.log('Tarefas carregadas.')
    ).error( ->
        console.error('Erro ao carregar tarefas')
    )

   tarefaData.createTarefa = (newTarefa) ->
    if newTarefa.tarefaTitulo == '' or newTarefa.tarefaDescricao == '' or newTarefa.tarefaData == ''
      alert('Preencha todos os campos')
      return false

    data =
      titulo: newTarefa.tarefaTitulo
      descricao: newTarefa.tarefaDescricao
      data: newTarefa.tarefaData

    $http.post('./tarefas.json', data).success( (data) ->
      tarefaData.data.tarefas.push(data)
      console.log('Tarefa criada.')

    ).error( ->
      console.error('Erro ao criar tarefas.')
  )

  tarefaData.excluirTarefa = (tarefa) ->
    $http.delete('./tarefas/'+tarefa.id+'.json').success( (data) ->
      console.log('Tarefa excluída.')
      location.reload();

    ).error( ->
      console.error('Erro ao excluir tarefa.')
    )

  return tarefaData

])