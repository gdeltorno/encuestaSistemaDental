package questionnarie
/*
*
* @author Roberto Pérez Alcolea (pr@manoderecha.mx)
*
*/


class Answer {
    String value

    static belongsTo = [question:Question]

    static constraints = {
        question(nullable: false)
        value(blank: false, unique: 'question')
    }

    String toString() {
        value
    }
}
