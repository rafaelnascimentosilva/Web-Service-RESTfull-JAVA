<html ng-app="listaDeContatos">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css"	href="../../resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"	href="../../resources/css/estilo.css">

	<script src="../../resources/lib/angular/angular.js"></script>
	<script src="../../resources/lib/angular/angular-route.js"></script>
	<script src="../../resources/js/app.js"></script>
	<script src="../../resources/js/config/routeConfig.js"></script>
	<script src="../../resources/js/jquery-2.2.4.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
</head>

<body ng-controller="listaDeContatosCtrl">
	
	<div class="row cabecalho">
		<div class="col-xs-12 col-md-6">
			<h1 ng-bind="app"></h1>
			<!-- <h2 >{{contatos}}</h2>-->
		</div>
		<div class="col-xs-12 col-md-4 col-md-offset-2 busca">
			<div class="input-group">
				<input type="text" name="busca" class="form-control"
					placeholder="Pesquisa por nome do contato"> <span
					class="input-group-btn">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="novoContato" >
		<div class="modal-dialog">
			<div class="modal-content">
			<div>
				<form>
					<div class="modal-header">
						<h1>Cadastro</h1>
					</div>
					<div class="modal-body">
						<label for="nome"> Nome:</label>
						<input id="nome" name="nome" type="text" ng-model="contatos.nome">
						<br>
						
						<label for="fone"> Fone:</label>
						<input id="fone" name="fone" type="text" ng-model="contatos.fone">
						<br>
						<label for="nascimento"> Nascimento:</label>
						<input id="nascimento" name="nascimento" type="text" ng-model="contatos.nascimento">
						<br>
					</div>
					<div class="modal-footer">
					<button class="btn btn-primary" data-backdrop="static" data-toggle="modal" data-target="#novoContato"   ng-click="salvar(contatos)"> Salvar</button>
					</div>
				</form>
			</div>
	
			</div>
		</div>
	</div>
	
	<div>
		<button class="btn btn-primary" data-toggle="modal" data-target="#novoContato">Novo Contato</button>
	</div>
	<div class="table-responsive" >
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Data de Nascimento</th>
				<th class="text-center">A��es</th>
			</tr>
			<tbody ng-repeat="c in contatos">
				<tr ng-repeat="contato in c">
					<td>{{contato.nome}}</td>
					<td>{{contato.fone}}</td>
					<td>{{contato.nascimento}}</td>
					<td class="text-center"><a href="AtualizarContato"><span
							class="glyphicon-pencil text-warning "></span></a> <a href="#delet"><span
							class="glyphicon glyphicon-trash text-danger"></span></a></td>

				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>