(function() {
  var TarefasList;

  TarefasList = angular.module('TarefasList', []);

  TarefasList.config([
    '$routeProvider', function($routeProvider) {
      $routeProvider.when('/addTarefa', {
        templateUrl: '../assets/addTarefa.html',
        controller: 'TarefaCtrl'
      });
      return $routeProvider.otherwise({
        templateUrl: '../assets/mainIndex.html',
        controller: 'IndexCtrl'
      });
    }
  ]);

}).call(this);
(function() {
  angular.module('TarefasList').factory('tarefaData', [
    '$http', '$location', function($http, $location) {
      var tarefaData;
      tarefaData = {
        data: {
          tarefas: [
            {
              titulo: '',
              nota: ''
            }
          ]
        },
        isLoaded: false
      };
      tarefaData.loadTarefas = function() {
        if (!tarefaData.isLoaded) {
          return $http.get('./tarefas.json').success(function(data) {
            tarefaData.data.tarefas = data;
            tarefaData.isLoaded = true;
            return console.log('Tarefas carregadas.');
          }).error(function() {
            return console.error('Erro ao carregar tarefas');
          });
        }
      };
      tarefaData.createTarefa = function(newTarefa) {
        var data;
        if (newTarefa.tarefaTitulo === '' || newTarefa.tarefaDescricao === '' || newTarefa.tarefaData === '') {
          alert('Preencha todos os campos');
          return false;
        }
        data = {
          titulo: newTarefa.tarefaTitulo,
          descricao: newTarefa.tarefaDescricao,
          data: newTarefa.tarefaData
        };
        return $http.post('./tarefas.json', data).success(function(data) {
          tarefaData.data.tarefas.push(data);
          return console.log('Tarefa criada.');
        }).error(function() {
          return console.error('Erro ao criar tarefas.');
        });
      };
      tarefaData.excluirTarefa = function(tarefa) {
        return $http["delete"]('./tarefas/' + tarefa.id + '.json').success(function(data) {
          console.log('Tarefa excluída.');
          return location.reload();
        }).error(function() {
          return console.error('Erro ao excluir tarefa.');
        });
      };
      return tarefaData;
    }
  ]);

}).call(this);
(function() {
  this.IndexCtrl = function($scope, tarefaData, $location) {
    var print;
    $scope.title = "My blog";
    $scope.data = tarefaData.data;
    tarefaData.loadTarefas();
    print = function() {
      return console.log($scope.data);
    };
    print();
    $scope.converteData = function(n, m) {
      var text;
      text = "";
      text += n;
      text += m;
      if (text === "01") {
        $scope.mes = "janeiro";
      }
      if (text === "02") {
        $scope.mes = "fevereiro";
      }
      if (text === "03") {
        $scope.mes = "março";
      }
      if (text === "04") {
        $scope.mes = "abril";
      }
      if (text === "05") {
        $scope.mes = "maio";
      }
      if (text === "06") {
        $scope.mes = "junho";
      }
      if (text === "07") {
        $scope.mes = "julho";
      }
      if (text === "08") {
        $scope.mes = "agosto";
      }
      if (text === "09") {
        $scope.mes = "setembro";
      }
      if (text === "10") {
        $scope.mes = "outubro";
      }
      if (text === "11") {
        $scope.mes = "novembro";
      }
      if (text === "12") {
        return $scope.mes = "dezembro";
      }
    };
    $scope.addTarefa = function() {
      return $location.path("/addTarefa");
    };
    return $scope.excluirTarefa = function(tarefa) {
      var resposta;
      resposta = confirm("Tem certeza que deseja excluir a tarefa?");
      if (resposta === true) {
        console.log(tarefa.id);
        return tarefaData.excluirTarefa(tarefa);
      }
    };
  };

  this.IndexCtrl.$inject = ['$scope', 'tarefaData', '$location'];

}).call(this);
(function() {
  this.TarefaCtrl = function($scope, $location, tarefaData) {
    $scope.tarefa = {
      tarefaTitulo: "",
      tarefaDescricao: "",
      tarefaData: ""
    };
    return $scope.addTarefa = function() {
      tarefaData.createTarefa($scope.tarefa);
      return $location.url("/");
    };
  };

  this.TarefaCtrl.$inject = ['$scope', '$location', 'tarefaData'];

}).call(this);
