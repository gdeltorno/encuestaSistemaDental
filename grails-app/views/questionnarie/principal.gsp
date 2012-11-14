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
    <meta name="layout" content="layout">

    <script src="https://s3.amazonaws.com/club_premier/js/jquery.js"></script>
	<link type="text/css" rel="stylesheet" href="https://s3.amazonaws.com/club_premier/common/login_corporate/styles/login.css" />
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
    #login-wrap{
    	margin-top: -14px;
    	background: #333 url(https://s3.amazonaws.com/CPcms/login-wrap-bg2.png) repeat-x !important;
    }
	.box{
		width: 800px;
		height: 350px;
		border-radius: 20px;
		box-shadow: inset 0 0 30px #333,
						  0 0 50px black;
		background-color: #eee;
		margin-top: 45px;
		position: absolute;
		font-family: "Trebuchet MS", sans-serif;
	}
	h1{
		font-style: italic;
		margin-top: 15px;
		color: #333;
	}
	h3{
		color: #333;
	}
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
    
<!--[if lt IE 9]>
    <style>
    #login-wrap{
    	*margin-top: 0;
    }
	.box{
		width: 924px;
		height: 365px;
		background: #eee url(https://s3.amazonaws.com/CPcms/box111.jpg) no-repeat !important;
		margin-top: 0;
		padding-top: 55px;
		*margin-left: -450px;
	}
	.navigator{
		width: 924px;
	}
    </style>
<![endif]-->
</head>
<body>

<div class="container" id="login-wrap" align="center">
	<div class="navigator">
		<div class="box">
			<h1>Club Premier Corporativo te premia por aire y tierra</h1>
			<h3>Tienes 
			<g:if test="${participacionesDisponibles == 0}" >
				<font color="darkred">${participacionesDisponibles}</font>
			</g:if>
			<g:else>
				<font color="#005c94">${participacionesDisponibles}</font>
			</g:else> 
			participaciones disponibles</h3>
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