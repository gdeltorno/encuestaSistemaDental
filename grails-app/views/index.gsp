<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Grails Twitter Bootstrap Scaffolding</title>
	</head>

	<body>
		<div class="row-fluid">
			<aside id="application-status" class="span3">
				<div class="well sidebar-nav">
                    <div id='login'>
                        <div class='inner'>
                            <div class='fheader'>Ingresa tu correo electrónico</div>
                            <br>

                            <g:form controller="questionnarie" action="login" method='POST' id='loginForm' class='cssform' autocomplete='off'>
                                <fieldset>
                                    <div class="row-fluid">

                                        <g:textField required="" name='email'/>
                                    </div>

                                    <g:hiddenField name="type" value="${type}"/>
                                </fieldset>

                                <div class="form-actions">

                                    <button class="btn" type="submit" name="_submit">
                                        Iniciar
                                    </button>
                                </div>

                            </g:form>
                        </div>
                    </div>


                </div>
			</aside>

			<section id="main" class="span9">

				<div class="hero-unit">
					<h1>Bienvenido</h1>

					<p>Porpósito.</p>
				</div>
					

			</section>
		</div>
		
	</body>
</html>
