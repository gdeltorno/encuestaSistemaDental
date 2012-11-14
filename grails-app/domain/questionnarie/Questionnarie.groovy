package questionnarie
/*
*
* @author Roberto Pérez Alcolea (pr@manoderecha.mx)
*
*/

class Questionnarie {
    transient participacionService
    transient cuestionarioService
    QuestionnarieType type
    String email
    QuestionnarieState state = QuestionnarieState.INICIADO

    static transients = ['correctAnswers','wrongAnswers','unasweredQuestions','duration','results']

    static hasMany = [questions:Question]


    static constraints = {
        questions(nullable: true)
        type(nullable: false)
        email(blank: false, unique: true)
    }

    def getResults() {
        Result.findAllByQuestionnarie(this)
    }

    def beforeInsert = {
        //Se obtienen las preguntas al azar para el questionnarie y se agregan a la colección del objeto.
        def questionList = cuestionarioService?.getQuestions(type)

        questions = questionList
    }
}
