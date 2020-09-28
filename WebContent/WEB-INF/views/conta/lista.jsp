<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Contas</title>
<script src="resources/js/jquery.js"></script>
<script>
function pagaAgora(id) {
	$.post("pagaConta", {'id' : id}, function() {
	  $("#conta_"+id).html("Paga");
	});
}
</script>
</head>
<body>

	<table>
		<tr>
			<th>Código</th>
			<th>Descrição</th>
			<th>Valor</th>
			<th>Tipo</th>
			<th>Paga?</th>
			<th>Data de Pagamento</th>
			<th>Ações</th>
		</tr>	
		
		<c:forEach items = "${todasContas }" var = "conta">
			<tr>
				<td>${conta.id }</td>
				<td>${conta.descricao }</td>
				<td>${conta.valor }</td>
				<td>${conta.tipo }</td>
				<td id="conta_${conta.id}">
					<c:if test ="${conta.paga eq false }">
					Não Paga
					</c:if>
					<c:if test ="${conta.paga eq true }">
					Paga !
					</c:if>
				</td>
				<td>
					<fmt:formatDate value = "${conta.dataPagamento.time }" pattern = "dd/MM/yyyy"/>
				</td>
				<td>
					<a href="removeConta?id=${conta.id }">Deletar</a> | 
				</td>
				<td>
					<a href="mostraConta?id=${conta.id}">Alterar</a> |
				</td>
				<td id="conta_${conta.id}">
				  <c:if test="${conta.paga eq false}">
				    <a href="#" onClick="pagaAgora(${conta.id})">
				      Pagar agora!
				    </a>
				  </c:if>
				  <c:if test="${conta.paga eq true }">
				    Paga!
				  </c:if>
				</td>
			</tr>	
		</c:forEach>	
	</table>
</body>
</html>