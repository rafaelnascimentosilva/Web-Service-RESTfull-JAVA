var app = angular.module("listaDeContatos",['ngMask','ngAnimate', 'ngSanitize', 'ui.bootstrap']);

app.controller("listaDeContatosCtrl",function($scope,ContatoService,$http ,$filter) {
	
	$scope.app = "Lista Telefônica";	
	$scope.contatos = [];
	
	$scope.listar = function() {
		ContatoService.listar().then(function (response) {
			 $scope.contatos = response.data.contato;			
			 $scope.totalItems = $scope.contatos.length;					
		});
	}
	
	$scope.novo = function(contato)	{
		$scope.contato = {};
	};
	
	$scope.salvar = function(contato) {			
		ContatoService.salvar(contato).then($scope.listar);		
		//delete $scope.contato;
	};
	
	$scope.deletar = function(contato) {		
		if(confirm("Deseja Excluir?")) {
			ContatoService.deletar(contato).then($scope.listar);
		}
	};
	
	$scope.editar = function(contato) {	
		$scope.contato = angular.copy(contato); 
		$scope.contato.nascimento = $filter("date")($scope.contato.nascimento,"dd/MM/yyyy");
	};
	
	$scope.paginar = function(limit,attr) {		
		ContatoService.paginado(limit,attr).then(function (response) {
			$scope.contatos = response.data.contato;				
		});		
	};	
});

app.service("ContatoService",function($http) {
	
	this.listar = function() {
		return $http.get("http://localhost:8080/project-contatos/rest/contato/contatos");		
	};
	
	this.salvar = function(contatos) {
		if (contatos.id) {
			return $http.put("http://localhost:8080/project-contatos/rest/contato/"+contatos.id,contatos);
		} else {
			return $http.post("http://localhost:8080/project-contatos/rest/contato",contatos);
		}		
	};
	
	this.deletar = function(contatos) {
		return $http.delete("http://localhost:8080/project-contatos/rest/contato/"+contatos.id);
	};
	
	this.paginado =  function(limit,attr) {
		return $http.get("http://localhost:8080/project-contatos/rest/contato/"+limit+"/"+attr);
	};		
});


app.filter("startFrom", function() {
	return function(data, start) {
		return data.slice(start);
	}
});

app.controller("PaginationCtrl", function ($scope, $log, ContatoService) {	
	
	  $scope.currentPage = 1;	  
	  $scope.pageSize = 3;	  
	  
	  $scope.setPage = function (pageNo) {
	    $scope.currentPage = pageNo;	   
	  };

	  $scope.pageChanged = function() {	    	  
	    $scope.paginar($scope.pageSize, $scope.setPage);
	  };

	  $scope.bigCurrentPage = 1;
	  
	});
