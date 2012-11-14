<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Test cuestionario</title>
<meta name="layout" content="layout">

<link type="text/css" rel="stylesheet"
      href="https://s3.amazonaws.com/club_premier/common/login_corporate/styles/login.css"/>



<script>


    $(function () {
        $('#chrono').val('00:00');
    });
</script>

<script language="JavaScript">

    <!--

    var timercount = 0;
    var timestart = null;

    function showtimer() {
        if (timercount) {
            clearTimeout(timercount);
            clockID = 0;
        }
        if (!timestart) {
            timestart = new Date();
        }
        var timeend = new Date();
        var timedifference = timeend.getTime() - timestart.getTime();
        timeend.setTime(timedifference);
        var minutes_passed = timeend.getMinutes();
        if (minutes_passed < 10) {
            minutes_passed = "0" + minutes_passed;
        }
        var seconds_passed = timeend.getSeconds();
        if (seconds_passed < 10) {
            seconds_passed = "0" + seconds_passed;
        }
        document.timeform.chrono.value = minutes_passed + ":" + seconds_passed;
        timercount = setTimeout("showtimer()", 1000);
    }

    function sw_start() {
        if (!timercount) {
            timestart = new Date();
            document.timeform.chrono.value = "00:00";
            document.timeform.laptime.value = "";
            timercount = setTimeout("showtimer()", 1000);
        }
        else {
            var timeend = new Date();
            var timedifference = timeend.getTime() - timestart.getTime();
            timeend.setTime(timedifference);
            var minutes_passed = timeend.getMinutes();
            if (minutes_passed < 10) {
                minutes_passed = "0" + minutes_passed;
            }
            var seconds_passed = timeend.getSeconds();
            if (seconds_passed < 10) {
                seconds_passed = "0" + seconds_passed;
            }
            var milliseconds_passed = timeend.getMilliseconds();
            if (milliseconds_passed < 10) {
                milliseconds_passed = "00" + milliseconds_passed;
            }
            else if (milliseconds_passed < 100) {
                milliseconds_passed = "0" + milliseconds_passed;
            }
            document.timeform.laptime.value = minutes_passed + ":" + seconds_passed + "." + milliseconds_passed;
        }
    }

    function Stop() {
        if (timercount) {
            clearTimeout(timercount);
            timercount = 0;
            var timeend = new Date();
            var timedifference = timeend.getTime() - timestart.getTime();
            timeend.setTime(timedifference);
            var minutes_passed = timeend.getMinutes();
            if (minutes_passed < 10) {
                minutes_passed = "0" + minutes_passed;
            }
            var seconds_passed = timeend.getSeconds();
            if (seconds_passed < 10) {
                seconds_passed = "0" + seconds_passed;
            }
            var milliseconds_passed = timeend.getMilliseconds();
            if (milliseconds_passed < 10) {
                milliseconds_passed = "00" + milliseconds_passed;
            }
            else if (milliseconds_passed < 100) {
                milliseconds_passed = "0" + milliseconds_passed;
            }
            document.timeform.timetextarea.value = minutes_passed + ":" + seconds_passed + "." + milliseconds_passed;
        }
        timestart = null;
    }

    function Reset() {
        timestart = null;
        document.timeform.timetextarea.value = "00:00";
        document.timeform.laptime.value = "";
    }

    //-->

</script>

<style>
#login-wrap {
    margin-top: -14px;
    background: #333 url(https://s3.amazonaws.com/CPcms/login-wrap-bg2.png) repeat-x !important;
}

.box {
    width: 800px;
    height: 350px;
    border-radius: 20px;
    box-shadow: inset 0 0 30px #333, 0 0 50px black;
    background-color: #eee;
    margin-top: 45px;
    position: absolute;
    font-family: "Trebuchet MS", sans-serif;
}

h1 {
    font-style: italic;
    margin-top: 15px;
    margin-left: 18px;
    color: #333;
    text-align: left;
}

h3 {
    color: #333;
}

.terms {
    width: 300px;
    height: 100px;
    background-color: #fff;
    overflow: auto;
    box-shadow: 0 0 3px #777;
}

.terms p {
    margin: 5px;
    font-size: 11px;
    text-align: justify;
}

.navigator {
    width: 800px;
}

.borde2 {
    border: 1px solid #ddd;
    width: 250px;
    margin-top: 20px;
    margin-left: 55px;
    border-radius: 20px;
    box-shadow: 1px 1px 3px #999;
    float: left;
    padding-bottom: 10px;
}

.logo {
	position: absolute;
    margin-left: 20px;
    margin-top: 220px;
}

.pregunta {
    float: left;
    width: 400px;
    height: 175px;
    margin-left: 35px;
    margin-top: 15px;
}

p {
    clear: both;
}

.chrono {
    position: absolute;
    margin-top: 60px;
    margin-left: 721px;
    z-index: 1;
}

#chrono {
    font-size: 20px;
    width: 58px;
    background-color: #444;
    color: white;
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
	.chrono{
		margin-left: 330px;
	}
	#firstText{
		margin-left: 75px;
	}
    </style>
	<![endif]-->
</head>

<body onload="sw_start();
return false;">

<div class="container" id="login-wrap" align="center">
    <div class="navigator">
        <div class="chrono"><form name="timeform">
            <input id="chrono" name="chrono">  <input type=hidden name="laptime" size="10" style="font-size:20px">

        </form>
        </div>

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