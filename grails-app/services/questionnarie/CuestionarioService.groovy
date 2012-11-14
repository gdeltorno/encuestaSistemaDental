package questionnarie
/*
*
* @author Roberto Pérez Alcolea (pr@manoderecha.mx)
*
*/


import java.io.File as JavaFile


class CuestionarioService {
    def participacionService
    def correoService
    def grailsApplication
    def utilsService
    def csvService

    static transactional = true

    String correctAnswerExpression = '|*|'
    String obligatoryQuestionExpression = ';Obligatoria'
    String questionExpression = '|;Pregunta|'
    String answerExpression = '||'
<<<<<<< HEAD
    String typeExpression = '|tipo|'

=======
>>>>>>> 61400018c150061aa1372b1ba8284ba4cdebd693

    Collection<Question> getQuestions(QuestionnarieType type) {
        Collection<Question> questions = Question.findAllByType(type)

        //Después se utiliza el método shuffle de la clase Collections para ordenar aleatoriamente la colección
        Collections.shuffle(questions, new Random())

        //Se regresa la colección
        return questions
    }

    Questionnarie createQuestionnarie(String email, QuestionnarieType type) {

        Questionnarie questionnarieInstance = null

        questionnarieInstance = saveQuestionnarie(email, type)

        return questionnarieInstance
    }

    //El método lleva acabo el salvado de un questionnarie
    Questionnarie saveQuestionnarie(String email, QuestionnarieType type) throws Exception {
        Questionnarie questionnarieInstance = null
        //Se abre una sesión Hibernate
        Questionnarie.withNewSession {
            try {
                questionnarieInstance = new Questionnarie(
                        email: email,
                        type: type,
                )
                questionnarieInstance.save(flush: true)

            } catch (Exception modelInstance) {
                throw new Exception(modelInstance)
                //correoService.sendEmail(correoService.errorMail, grailsApplication.config.grails.fromMailAddress, utilsService.getMessageCode("cuestionarioService.saveCuestionario.label"), "/mail/errorContestMail", modelInstance, correoService.errorMailCC)
            }
        }
        return questionnarieInstance
    }

    //El método actualiza el state del questionnarie según el recibido
    Questionnarie updateQuestionnarie(Questionnarie questionnarie, QuestionnarieState state) {
        //Se abre una sesión hibernate
        Questionnarie.withSession {
            try {
                //Se modifica el atributo active y se guarda el objeto
                questionnarie.state = state
                questionnarie.save(flush: true)
            } catch (Exception modelInstance) {
                println modelInstance
                //correoService.sendEmail(correoService.errorMail, grailsApplication.config.grails.fromMailAddress, utilsService.getMessageCode("cuestionarioService.actualizarCuestionario.label"), "/mail/errorContestMail", modelInstance, correoService.errorMailCC)
            }
            return questionnarie
        }
    }
    //El método actualiza el state del questionnarie a terminado
    Questionnarie setFinishedQuestionnarie(Questionnarie questionnarie) {
        updateQuestionnarie(questionnarie, QuestionnarieState.TERMINADO)
    }



    //El método guarda un resultado de la question para el questionnarie
    Result saveResult(Questionnarie questionnarie, Question question, Answer answer) {
        Result resultadoInstance = null
        Result.withNewSession {
            try {
                resultadoInstance = new Result(
                        questionnarie: questionnarie,
                        question: question,
                        answer: answer
                ).save(flush: true)
            } catch (Exception modelInstance) {
                //correoService.sendEmail(correoService.errorMail, grailsApplication.config.grails.fromMailAddress, utilsService.getMessageCode("cuestionarioService.saveResultado.label"), "/mail/errorContestMail", modelInstance, correoService.errorMailCC)
            }
        }
        return resultadoInstance
    }

    //El método recorre los resultados del parsing csv y manda a crear las preguntas y sus respuestas
<<<<<<< HEAD
    def createQuestions(JavaFile data, QuestionnarieType type) {
=======
    def createQuestions(JavaFile data) {
>>>>>>> 61400018c150061aa1372b1ba8284ba4cdebd693
        Question questionInstance = null
        Answer answerInstance = null

        //Se recorre el objeto data obtenido del parsing CSV
        data.eachLine { line ->
            line = line.toString()

            if (line.contains(questionExpression)) {

                line = line.minus(questionExpression)
                /*
                 Si la línea contiene la expresión de question obligatory se guarda la question como tal
                 De lo contrario se almacena la question con un false (sobre-carga de método)
                 Se hace uso del operador ternario de groovy para crear la expresión de salvado
                */
<<<<<<< HEAD
                questionInstance = saveQuestion(line.minus(obligatoryQuestionExpression), type)
=======
                questionInstance = (line.contains(obligatoryQuestionExpression)) ? saveQuestion(line.minus(obligatoryQuestionExpression), true) : saveQuestion(line)
>>>>>>> 61400018c150061aa1372b1ba8284ba4cdebd693


            } else {

                /*
                 Si la línea contiene la expresión de respuesta correct se guarda la respuesta como tal
                 De lo contrario se almacena la respuesta con un false (sobre-carga de método)
                 Se hace uso del operador ternario de groovy para crear la expresión de salvado
                */
<<<<<<< HEAD
                answerInstance = saveAnswer(questionInstance, line.minus(answerExpression))
=======
                answerInstance = (line.contains(correctAnswerExpression)) ? saveAnswer(questionInstance, line.minus(correctAnswerExpression), true) : saveAnswer(questionInstance, line.minus(answerExpression))
>>>>>>> 61400018c150061aa1372b1ba8284ba4cdebd693

            }

        }

    }

    //El método salva las preguntas a partir de la importación del file
<<<<<<< HEAD
    protected saveQuestion(String description, QuestionnarieType type) {
=======
    protected saveQuestion(String description, boolean obligatory, QuestionnarieType type) {
>>>>>>> 61400018c150061aa1372b1ba8284ba4cdebd693
        Question questionInstance = null
        Question.withNewSession {
            try {
                questionInstance = new Question()
                questionInstance.description = description
                questionInstance.type = type
                questionInstance.save(flush: true)
            } catch (Exception modelInstance) {
                println modelInstance
            }
        }
        return questionInstance
    }

<<<<<<< HEAD

=======
    //Se sobre sobre carga el método para no enviar el parámetro de obligatory
    protected saveQuestion(String descripcion) {
        saveQuestion(descripcion, false)
    }
>>>>>>> 61400018c150061aa1372b1ba8284ba4cdebd693


    //El método salva las respuestas a partir de la importación del file
    protected saveAnswer(Question questionInstance, String value, boolean correct) {
        Answer answerInstance = null
        Answer.withNewSession {
            try {
                answerInstance = new Answer()
                answerInstance.question = questionInstance
                answerInstance.value = value
                answerInstance.save(flush: true)
            } catch (Exception modelInstance) {
                println modelInstance
            }
        }
        return answerInstance
    }

    //Se sobre sobre carga el método para no enviar el parámetro de correct
    protected saveAnswer(Question questionInstance, String value) {
        saveAnswer(questionInstance, value, false)
    }

}
