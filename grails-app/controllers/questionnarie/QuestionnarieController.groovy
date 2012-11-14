package questionnarie

class QuestionnarieController {

    def cuestionarioService


    def personal() {
        render(view:'/index', model:[type:'personal'])


    }

    def organizacion() {
        render(view:'/index', model:[type:'organizacion'])

    }
    def index() {
        render(view: "/index")
    }

    def login() {

        def questionnarieInstance = Questionnarie.findByEmail(params?.email)

        def type = (params?.type == "personal") ? QuestionnarieType.PERSONAL : QuestionnarieType.INSTITUCIONAL

        if (questionnarieInstance) {

            flash.error = message(code: "usuario.yaContesto.label", default: "Este correo electrónico ya ha contestado la encuesta")
            redirect(action: "index")
        } else {
            session["type"] = type
            session["email"] = questionnarieInstance?.email
            forward(action: "principal")
        }



    }


    def principal() {
        //Se hace render de la vista principal con las participaciones disponibles, puedeContestar y el user
        render(view: "principal", model: [canAnswer: true])
    }

    def createQuestionnarie() {
        if (params.terminosAceptados) {
            String email = session["email"]

            QuestionnarieType type = (QuestionnarieType) session["type"]
            //Se crea un questionnarie para al user.
            Questionnarie questionnarieInstance = cuestionarioService.createQuestionnarie(email,type)

            if (questionnarieInstance) {
                //Se llama el servicio de participación para desactivar la participación
                forward(action: "initQuestionnarie", id: questionnarieInstance?.id)
            } else {
                flash.error = message(code: "cuestionario.noPosibleIniciar.label", default: "No se pudo iniciar el cuestionario")
                redirect(action: "principal")
            }
        } else {
            //flash.error = message(code: "cuestionario.terminosNoAceptados.label", default: "Debes aceptar los términos y condiciones")
            redirect(action: "principal")
        }
    }

    def initQuestionnarie() {
        Questionnarie questionnarieInstance = Questionnarie.get(params.id)
        if (questionnarieInstance) {

            //Se guarda en el objeto session el listado de preguntas correspondiente al questionnarie
            def questionsIds = questionnarieInstance?.questions?.id?.toList()

            saveQuestionsInSession(questionsIds)

            //Se inicializa la question actual en el objeto session
            saveActualQuestionInSession(0)

            //Se envía el id del questionnarie a la acción 'responderPregunta'
            render(view: "index", model: [questionnarieInstance: questionnarieInstance])
        } else {
            flash.error = message(code: "cuestionario.noPosibleIniciar.label", default: "No se pudo iniciar el cuestionario")
            redirect(action: "principal")
        }
    }


    def renderQuestion() {
        //Se declara la leyenda del botón
        String buttonLegend = "Siguiente"

        //Se guarda la question actual en el objeto session
        saveActualQuestionInSession(session["actualQuestion"] + 1)

        //Se obtiene el questionnarie
        Questionnarie questionnarieInstance = Questionnarie.get(params.id)

        //Se obtiene la lista de preguntas del objeto session
        List<Long> questionList = session?.questionnarieQuestions

        //Se obtiene la primer question de la lista
        Question questionInstance = Question.get(questionList?.get(0))

        //Si el tamaño de la lista es 1, la leyenda del botón será Terminar.
        if (questionList?.size()?.equals(1)) buttonLegend = "Terminar"
        //Se hace un render para responder la question
        render(template: "answerQuestion", model: [buttonLegend: buttonLegend, questionnarieInstance: questionnarieInstance, questionInstance: questionInstance, actualQuestion: session["actualQuestion"], questionsTotal: questionnarieInstance?.questions?.size()])

    }

    def saveAnswer() {
        //Se obtiene el questionnarie
        Questionnarie questionnarieInstance = Questionnarie.get(params.id)

        //Se obtiene la question
        Question questionInstance = Question.get(params.questionId)

        //Se obtiene la respuesta
        Answer answerInstance = Answer.get(params.answerId)

        Result resultInstance = cuestionarioService.saveResult(questionnarieInstance, questionInstance, answerInstance)

        if (resultInstance) {
            //Se obtiene la lista de preguntas del objeto session
            List<Long> questionList = session?.questionnarieQuestions

            //Se elimina de la lista de preguntas la que se está contestando
            questionList.remove(questionInstance?.id)

            //Se guarda en el objeto session el listado de preguntas correspondiente al questionnarie restantes
            saveQuestionsInSession(questionList)

            if (questionList) {
                //Se regresa a la acción renderPregunta para mostrar la siguiente question.
                forward(action: "renderQuestion", id: questionnarieInstance?.id)
            } else {
                forward(action: "finishQuestionnarie", id: questionnarieInstance?.id)
            }


        } else {
            /*
            TODO: Revisar que acción se tomará si el resultado no se crea
            - Podría ser que se termine el questionnarie con las respuestas faltantes
            - Se podría intentar regresar a la question (pero se puede crear un ciclo infinito)
            */
        }


    }

    def finishQuestionnarie() {

       //Se debe enviar desde la vista el questionnarie
        Questionnarie questionnarieInstance = Questionnarie.get(params.id)

        //Se actualiza como terminado el questionnarie y se cambia la fecha de fin del custionario
        questionnarieInstance = cuestionarioService.setFinishedQuestionnarie(questionnarieInstance)

        if (questionnarieInstance) {

            render(template: "finished", model: [questionnarieInstance: questionnarieInstance])

        } else {
            flash.error = message(code: "cuestionario.noTerminado.label", default: "Error al almacenar el cuestionario, contacte al administrador")
            render(template: "finished")
        }
    }



    def saveQuestionsInSession(List<Long> questionList) {
        //Se guarda en el objeto session el listado de ids de las preguntas correspondiente al questionnarie
        setSessionAttribute("questionnarieQuestions", questionList)
    }

    def setSessionAttribute(def attribute, value) {
        if (session."${attribute}") {
            session.removeAttribute(attribute)
        }

        session.setAttribute(attribute, value)
    }

    def saveActualQuestionInSession(Integer value) {
        //Se guarda en el objeto session el listado de ids de las preguntas correspondiente al questionnarie
        setSessionAttribute("actualQuestion", value)
    }

}
