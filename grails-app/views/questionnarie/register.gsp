<html>
<head>
    <meta name='layout' content='layout'/>
    <title>Iniciar sesión</title>

    <link rel="stylesheet" href="https://s3.amazonaws.com/club_premier/common/login_corporate/styles/reset.css"/>
    <link rel="stylesheet" href="https://s3.amazonaws.com/club_premier/common/login_corporate/styles/login.css"/>

    <script type="text/javascript"
            src="https://s3.amazonaws.com/club_premier/js/jquery.validationEngine-es.js?date=13012012"></script>

    <script type="text/javascript" src="https://s3.amazonaws.com/club_premier/js/jquery.validationEngine.js"></script>
    <link rel="stylesheet" href="https://s3.amazonaws.com/club_premier/css/validationEngine.jquery.css" type="text/css">


    <style>
    #login-wrap {
        margin-top: -14px;
    }

    h3 {
        font-size: 1.17em;
        font-weight: bold;
    }

    .login_message {
        color: #C33;
        margin-top: 10px;
    }
    </style>

    <!--[if lt IE 9]>
	<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

</head>

<body>

<div id="login-wrap">
    <div id="login-bg">
        <section id="login-corp" class="login-corporativo">

            <g:form action='login' controller="questionnarie" method='POST' id='loginForm' class='loginForm'
                    autocomplete='off'>

                <img src="https://s3.amazonaws.com/club_premier/common/login_corporate/img/login-top.png" alt=""/>

                <g:if test='${flash.message}'>
                    <div class='login_message'>${flash.message}</div>
                </g:if>


                <g:if test='${flash.error}'>
                    <div class="errors">
                        <div class='login_message'>${flash.error}</div>
                    </div>

                </g:if>

                <g:hasErrors bean="${employeeInstance}">
                    <div class="errors">
                        <div class='login_message'><g:renderErrors bean="${employeeInstance}" as="list"/></div>
                    </div>
                </g:hasErrors>

                <div class="login-form-input">
                    <label for='employeeNumber'><g:message code="employee.employeeNumber.label" default=""/>:</label>
                    <span class="login-tooltip"></span>
                    <% def employeeNumber = message(code: 'employee.employeeNumber.holder.label') %>
                    <input type='text' class="validate[required]" name='employeeNumber' id='employeeNumber'
                           placeholder='${employeeNumber}' required="required"
                           value="${employeeInstance?.employeeNumber}" tabindex="1"/>
                </div>

                <div class="login-form-input">
                    <label for='fullname'><g:message code="employee.fullname.label"/>:</label>
                    <span class="login-tooltip"></span>
                    <% def fullname = message(code: 'employee.fullname.holder.label') %>
                    <input type='text' class='text_' name='fullname' id='fullname' placeholder='${fullname}'
                           required="required" value="${employeeInstance?.fullname}" tabindex="2"/>
                </div>

                <div class="login-form-input">
                    <label for='company'><g:message code="employee.company.label"/>:</label>
                    <span class="login-tooltip"></span>
                    <% def company = message(code: 'employee.company.holder.label') %>
                    <input type='text' class='text_' name="company" id='company' placeholder='${company}'
                           value="${employeeInstance?.company}" required="required" tabindex="3"/>
                </div>

                <div class="login-form-input">
                    <label for='extension'><g:message code="employee.extension.label"/>:</label>
                    <span class="login-tooltip"></span>
                    <% def extension = message(code: 'employee.extension.holder.label') %>
                    <input type='text' class='text_' name="extension" id='extension' placeholder='${extension}'
                           value="${employeeInstance?.extension}" required="required" tabindex="3"/>
                </div>

                <button type="submit" class="button_orange_login" tabindex="4"><g:message code="login.button"/></button>

                </g:form>


            <g:form action='createEmployee' controller="questionnarie" method='POST' id='loginForm' class='loginForm'
                    autocomplete='off'>
                <button type="submit" class="button_orange_login" tabindex="4"><g:message code="register.button"/></button>

            </g:form>
        </section>
    </div>
</div>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['login-form'].elements['corporate'].focus();
    })();
    // -->

    jQuery(function ($) {
        var OSX = {
            container:null, init:function () {
                $("input.osx, a.osx").click(function (e) {
                    e.preventDefault();

                    $("#osx-modal-content").modal({
                        overlayId:'osx-overlay',
                        containerId:'osx-container',
                        closeHTML:null,
                        minHeight:80,
                        opacity:65,
                        position:['0', ],
                        overlayClose:true,
                        onOpen:OSX.open,
                        onClose:OSX.close
                    });
                });
                $("input.rosx, a.rosx").click(function (e) {
                    e.preventDefault();

                    $("#osx-modal2-content").modal({
                        overlayId:'osx-overlay',
                        containerId:'osx-container',
                        closeHTML:null,
                        minHeight:80,
                        opacity:65,
                        position:['0', ],
                        overlayClose:true,
                        onOpen:OSX.open,
                        onClose:OSX.close
                    });

                });
            },
            open:function (d) {
                var self = this;
                self.container = d.container[0];
                d.overlay.fadeIn('slow', function () {
                    $("#osx-modal-content", self.container).show();
                    $("#osx-modal2-content", self.container).show();
                    var title = $("#osx-modal-title", self.container);
                    title.show();
                    d.container.slideDown('slow', function () {
                        setTimeout(function () {
                            var h = $("#osx-modal-data", self.container).height()
                                    + title.height()
                                    + 20; // padding
                            d.container.animate(
                                    {height:h},
                                    200,
                                    function () {
                                        $("div.close", self.container).show();
                                        $("#osx-modal-data", self.container).show();
                                    }
                            );
                        }, 300);
                    });
                })
            },
            close:function (d) {
                var self = this; // this = SimpleModal object
                d.container.animate(
                        {top:"-" + (d.container.height() + 20)},
                        500,
                        function () {
                            self.close(); // or $.modal.close();
                        }
                );
            }
        };

        OSX.init();
    });

</script>

<!-- modal content -->
<div id="osx-modal2-content" style="display:none">
    <div id="osx-modal-title"><g:message code="springSecurity.login.modalTitle.label"/></div>

    <div class="close"><a href="#" class="simplemodal-close">x</a></div>

    <div id="osx-modal-data">
        <h2><g:message code="springSecurity.login.modalInformation.label"/></h2>

        <p><pre><g:message code="modalbox.default.mexDF.label"/>      (52 55) 5133 4000</pre></p>
        <p><pre><g:message code="modalbox.default.allMexico.label"/>    01 (800) 021 4000</pre></p>
        <p><pre><g:message code="modalbox.default.argentina.label"/>      0800 888 2276</pre></p>
        <p><pre><g:message code="modalbox.default.brazil.label"/>         0800 891 7512</pre></p>
        <p><pre><g:message code="modalbox.default.unitedStates.label"/>  1 (800) 247 3737</pre></p>
        <p><pre><g:message code="modalbox.default.Spain.label"/>          (3491) 559 8845</pre></p>
        <p><g:message code="modalbox.default.textEnd.label"/></p>

        <p><button class="simplemodal-close"><g:message code="modalbox.default.close.label"/></button></p>
    </div>
</div>

</body>
</html>
