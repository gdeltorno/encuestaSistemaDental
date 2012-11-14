/*
*
* @author Roberto Pérez Alcolea (pr@manoderecha.mx)
*
*/


class Question {
    String description
    QuestionnarieType type

    //se declara un atributo type transients (sin persistencia) para las respuestas
    static transients = ['answers','results']

    static constraints = {
        description(blank: false)
    }

    //Se hace un mapeo estático para que el campo descripción sea type text.
    static mapping = {
        description type: 'text'
    }

    String toString() {
        description
    }

    //El método busca las respuestas de la question
    def getAnswers() {
        Answer.findAllByQuestion(this)
    }

    def beforeDelete() {
        //Antes de eliminar una question se abre una sesión y se eliminan las respuestas
        Answer.withNewSession {
            answers*.delete()
        }
    }

    //En caso de requerirse el método regresa los resultados de una question
    def getResults() {
        Result.findAllByQuestion(this)
    }
}
