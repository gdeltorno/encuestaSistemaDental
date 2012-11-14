<%--
  Created by IntelliJ IDEA.
  User: robertoperezalcolea
  Date: 15/08/12
  Time: 08:55
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Test cuestionario</title>
    <meta name="layout" content="bootstrap">

      <script type="text/javascript">
        $(document).ready(function() {
            $("input[name=terminosAceptados], #terminosAceptados").click(function() {
                $("#submitButton").attr("disabled",
                        !($("input[name=terminosAceptados]").is(":checked") && $("#terminosAceptados").is(":checked")));
            });
            $('#submitButton').css('opacity','0.6');
        });
        function opacity(){
            if($("input[name=terminosAceptados]").is(":checked")){ $('#submitButton').css('opacity','1'); }
            else{ $('#submitButton').css('opacity','0.6'); }
        }
    </script>
    <style>

	.terms{
		width:300px;
		height:100px;
		background-color: #fff;
		overflow: auto;
		box-shadow: 0 0 3px #777;
	}
	.terms p{
		margin: 5px;
		font-size: 11px;
		text-align: justify;
	}
    .terms ol{
        list-style-type:lower-alpha;
        margin: 2px;
        font-size: 11px;
        text-align: justify;
    }
    .terms table, td, th {
        border: 1px solid black;

    }
    .terms td {
        margin:4px;
    }

    .terms ul{
        margin: 2px;
        font-size: 11px;
        text-align: justify;
    }
	.navigator{
		width: 800px;
	}
    </style>
    

</head>
<body>

<div class="container" id="login-wrap" align="center">
	<div class="navigator">
		<div class="box">
			<h1>Encuesta dental</h1>

			<div class="terms">
                <g:render template="terms"/>
			</div>
            <g:if test="${canAnswer}">
                <g:form controller="questionnarie" action="createQuestionnarie">
					<p><br><g:checkBox name="terminosAceptados" id="terminosAceptados" value="Acepto los términos y condiciones" checked="false" onclick="opacity()"/> Acepto Términos y condiciones</p>
					<button type="submit" class="btn btn-red" name="submitButton" id="submitButton" disabled="disabled"><span>Iniciar cuestionario</span></button>
					<g:render template="backButton"/>
				</g:form>
			</g:if>
						<g:else>
			<br><br>
			<g:render template="backButton"/>
			</g:else>
		</div>
	</div>
</div>

<g:if test="${flash.message || flash.error}">
<div class="message">${flash?.message}${flash?.error}</div>
</g:if>

</body>
</html>