/*
*
* @author Roberto Pérez Alcolea (pr@manoderecha.mx)
*
*/



import groovy.time.TimeCategory
import groovy.time.TimeDuration

import javax.xml.bind.ValidationException

class Questionnarie {
    transient participacionService
    transient cuestionarioService
    QuestionnarieType type
    String email

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
}
