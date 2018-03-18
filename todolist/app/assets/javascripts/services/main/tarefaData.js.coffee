angular.module('todolist').factory('tarefaData', ['$http', ($http) ->
  tarefaData =
    data:
      tarefas: [{titulo: 'Loading', nota: ''}]
    isLoaded: false

  tarefaData.loadTarefas = ->
    if !tarefaData.isLoaded
      $http.get('./tarefas.json').success( (data) ->
        tarefaData.data.tarefas = data
        tarefaData.isLoaded = true
        console.log('Successfully loaded posts.')
      ).error( ->
        console.error('Failed to load posts.')
      )

  tarefaData.createTarefa = (newTarefa) ->
    # Client-side data validation
    if newTarefa.newTarefaTitulo == '' or newTarefa.newTarefaNota == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_tarefa:
        titulo: newTarefa.newTarefaTitulo
        nota: newTarefa.newTarefaNota

    console.log(data)
    # Do POST request to /posts.json
    $http.post('./tarefas.json', data).success( (data) ->
      
      # Add new post to array of posts
      tarefaData.data.tarefas.push(data)
      console.log('Successfully created post.')

    ).error( ->
      console.error('Failed to create new post.')
    )

  return tarefaData

])
