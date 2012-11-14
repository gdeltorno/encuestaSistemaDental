<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Encuesta dental</title>
<meta name="layout" content="bootstrap">

<body>

<div class="container" id="login-wrap" align="center">
    <div class="navigator">

        <div class="box" id="box">
                <g:if test="${questionnarieInstance}">
                    <g:include controller="questionnarie" action="renderQuestion" id="${questionnarieInstance?.id}"/>
                </g:if>
                <g:else>
                    No se pudo iniciar el cuestionario. Por favor contacte al administrador.
                </g:else>

        </div>
    </div>
</div>

<g:if test="${flash.message || flash.error}">
    <div class="message">${flash?.message}${flash?.error}</div>
</g:if>

<r:layoutResources/>

</body>
</html>