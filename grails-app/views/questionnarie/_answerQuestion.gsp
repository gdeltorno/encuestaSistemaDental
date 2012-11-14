<script type="text/javascript">
    $(document).ready(function () {
        $('input:radio').click(function () {
            var buttonsChecked = $('input:radio:checked');
            if (buttonsChecked.length) {
                $('#submitButton').removeAttr('disabled');
            }
            else {
                $('#submitButton').attr('disabled', 'disabled');
            }
        });
    });
</script>
	<!--[if lt IE 9]>
    <style>
    h1{
    	margin-left: 80px;
    }
	.pregunta{
		margin-left: 90px;
		margin-top: 5px;
		height: 185px;
	}
	.borde2{
		margin-top: 0px;
	}
	.logo{
		margin-left: -780px;
	}
	h1, h2, h3, h4, h5, h6 {

h3 {
display: block;
font-size: 1.07em;
-webkit-margin-before: 0em;
-webkit-margin-after: 0em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
font-weight: bold;
}
    </style>
	<![endif]-->
<g:setProvider library="jquery"/>

<g:formRemote name="pregunta" on404="alert('no se pudo contestar la pregunta!')" update="pregunta"
              url="[controller: 'questionnarie', action: 'saveAnswer']">
    <h1>${actualQuestion} de ${questionsTotal}</h1>

<div style="height:270px">
    <div class="pregunta"><h3>${questionInstance}</h3></div>
    
    <g:hiddenField name="questionId" id="questionId" value="${questionInstance?.id}"/>
    <g:hiddenField name="id" id="id" value="${questionnarieInstance?.id}"/>
	<div class="borde2" align="left">
		<div style="margin-left:15px;margin-top:15px">
    		<g:each in="${questionInstance.answers}" var="answer">
		        <input type="radio" name="answerId" id="answerId" value="${answer?.id}" style="margin-bottom:10px">
	            <span>${answer.value}</span><br>
    		</g:each>
    	</div>
    </div>
	<div class="logo">
		<button type="submit" class="btn btn-red" id="submitButton" disabled="disabled" style="margin-left:160px"><span>${buttonLegend}</span></button>
	</div>
</div>

</g:formRemote>