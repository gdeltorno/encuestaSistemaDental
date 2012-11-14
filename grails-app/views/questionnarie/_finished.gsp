<script>
$(function(){
	$('#chrono').hide();
});
</script>
<style>
.borde2{
	border: 1px solid #ddd;
	width: 450px;
	margin-top: 0;
	margin-left: 179px;
	border-radius: 20px;
	box-shadow: 1px 1px 3px #999;
	clear: left;
	padding-bottom: 0;
}
h1{
	font-style: italic;
	margin-top: -15px;
	margin-left: 0;
	margin-bottom: 12px;
	font-size: 30px;
    color: #333;
    text-align: center;
}
h3{
	clear: left;
}
</style>
	<!--[if lt IE 9]>
    <style>
	.borde2{
		margin-left: 229px;
	}
    </style>
	<![endif]-->

<h3 style="margin-top:20px">Haz concluído con éxito tu participación en la trivia Club Premier Corporativo</h3>
<div style="margin-left:20px"><h2>¡Gracias por tu participación!</h2></div>
<div class="borde2">
	<h3 style="margin-top:10px">Tus resultados son:</h3>
	<h3><font color="#005c94">${correctAnswers}</font> respuestas correctas en<br>
	<font color="#005c94">${duration}</font></h3>
</div>
<br>
<h3></h3>
<br>
<button class="btn btn-red" onClick="location.href='http://corporativo.clubpremier.com'" >Salir</button>

<%--
<g:if test="${flash.message || flash.error}">
<div class="message">${flash?.message}${flash?.error}${flash.clear()}</div>
</g:if>
<br><br>
Respuestas correctas: ${correctAnswers}<br><br>
Tiempo total: ${duration}
<g:link controller="questionnarie" action="principal">Continuar</g:link>
 --%>