package questionnarie
/*
*
* @author Roberto Pérez (pr@manoderecha.mx)
*
*/


public enum QuestionnarieType implements org.springframework.context.MessageSourceResolvable {
    //Se definen los operadores que se van a manejar en la enumeración.
    PERSONAL,INSTITUCIONAL

    //Se utiliza en conjunto con la interfaz 'MessageSourceResolvable'.
    Object[] getArguments() { [] as Object[] }

    //Se regresa el código del message propierties.
    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    //Se regresa el nombre de la enumeración
    String getDefaultMessage() { name() }

    //Se obtiene el code el message properties
    String getMessageCode() { return "${getClass().name}.${name()}" }

    //Se define la lista con las enumeraciones
    public static final list() { [PERSONAL,INSTITUCIONAL] }

}