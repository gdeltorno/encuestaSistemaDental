package questionnarie
/*
*
* @author Roberto Pérez Alcolea (pr@manoderecha.mx)
*
*/


class Result {
    Question question

    Answer answer

    static belongsTo = [questionnarie:Questionnarie]

    static constraints = {
        //Se aplica una restricción para que solo se registre una question por única ocasión en un questionnarie.
        question(nullable: false, unique: 'questionnarie')
        answer(nullable: false)
        questionnarie(nullable: false)
        //Se valida que la question de la respuesta sea igual a la question del objeto
        answer validator: { answer, object ->
            answer?.question?.equals(object?.question)
        }
    }

    String toString() {
       "${questionnarie?.email} - $question - $answer"
    }


}
