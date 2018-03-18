angular.module('todolist').factory('tarefaData', ['$http', ($http) ->
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
    if newTarefa.newTarefaTitulo == '' or newTarefa.newTarefaNota == '' or newTarefa.newTarefaData == ''
      alert('Preencha todos os campos')
      return false

    data =
      new_tarefa:
        titulo: newTarefa.newTarefaTitulo
        nota: newTarefa.newTarefaNota
        data: newTarefa.newTarefaData

    $http.post('./tarefas.json', data).success( (data) ->
      tarefaData.data.tarefas.push(data)
      console.log('Tarefa criada.')

    ).error( ->
      console.error('Erro ao criar tarefas.')
    )
  
  tarefaData.excluirTarefa = (id) ->
    $http.delete('./tarefas/'+id+'.json').success( (data) ->
      tarefaData.data.tarefas.pop(data)
      console.log('Tarefa excluída.')

    ).error( ->
      console.error('Erro ao excluir tarefa.')
    )
  return tarefaData

])
