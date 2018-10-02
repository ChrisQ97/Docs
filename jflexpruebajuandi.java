package Lexico;

/* comentarios de la clase */

%%

%class Numeros /*nombre de la clase. Cuando se genere hara una clase llamada numeros*/
%unicode
%public
%unicode
%column
%line

%standalone

LineTerminator = \r|\n|\r\n /*(terminadores de linea en windows, linux y mac)*/
WhiteSpace = {LineTerminator} | [ \t\f] | [\r?$]

/*Saltos de estados*/
SaltoIaT = \{ /*Con este caracter se realiza el salto de estados*/
SaltoTaI = \}
SaltoIaH = \(
SaltoHaI = \)

/*Lenguajes reconocidos*/
Decimal = [0-9][0-9]*
Hexadecimal = 0[xX]({Decimal}|[a-fA-F])+
Octal = [0-7]+[oO]
Binario = [0-1]+[bB]
Numeros = {Decimal}|{Hexadecimal}|{Octal}|{Binario}
Letras = [a-zA-Z][a-zA-Z]*
Coment = \#

/*Lenguajes no reconocidos*/
LNnr1 = [g-zG-Z]
LNnr2 = ({Decimal}[a-fA-F] | [a-fA-F]{Decimal} | [a-fA-F])
LNnr3 = [1-7]*[8-9][1-7]*[oO]
LNnr4 = [0-1]*[2-9][0-1]*[bB]
LNnr5 = 0[xX](({Decimal}|a-fA-F)*[g-zG-Z]({Decimal}|a-fA-F)*)+
LNnr6 = ({Hexadecimal}|{Octal}|{Binario})({Hexadecimal}|{Octal}|{Binario})+
LNnr = {LNnr1}|{LNnr2}|{LNnr3}|{LNnr4}|{LNnr5}|{LNnr6}


/*Crear logica de los estados*/
%state HEXA 
%state LETRAS
%state COMENTARIO
/*palabra para crear otros estados y su nombre*/


%init{
    // Esto va al constructor

    this.contador = new Contador();
%init}

%{
    //Definir metodos

    //Definir propiedades
    public static Contador contador;
%}



%%

<YYINITIAL>
{
/*Comentarios*/
    {Coment}                        {
                                        yybegin(COMENTARIO); 
                                    }

/*Excepciones de numeros*/
    ({Numeros}*{LNnr}+{Numeros}*)+  {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                    }

/*Lenguaje reconocido*/
    {Decimal}{WhiteSpace}           {
                                        System.out.println("Encontre un decimal: " + yytext());
                                        contador.addDecimal();
                                    }

/*Errores*/
    {Hexadecimal}{WhiteSpace}       {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                        System.out.println("No deberia haber un hexadecimal en esta parte");
                                    }

    {Letras}{WhiteSpace}            {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                        System.out.println("No deberian haber letras en esta parte");
                                    }
    
/*Regla de cambio de estado:*/
    {SaltoIaH}                      {
                                        yybegin(HEXA);
                                    }
    {SaltoIaT}                      {
                                        yybegin(LETRAS);
                                    }
}

<HEXA>
{
/*Comentarios*/
    {Coment}                        {
                                        yybegin(COMENTARIO); 
                                    }

    ({Numeros}*{LNnr}+{Numeros}*)+  {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                    }

    {Hexadecimal}{WhiteSpace}       {
                                        System.out.println("Encontre un hexa: " + yytext());
                                        contador.addHexadecimal();
                                    }
    
/*Errores*/
    {Letras}{WhiteSpace}            {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                        System.out.println("No deberian haber letras en esta parte");
                                    }
    
    {Decimal}{WhiteSpace}           {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                        System.out.println("No deberian haber decimales en esta parte");
                                    }
/*Regla de cambio de estado*/
    {SaltoHaI}                      {
                                        yybegin(YYINITIAL);
                                    }
}

<LETRAS>
{
/*Comentarios*/
    {Coment}                        {
                                        yybegin(COMENTARIO); 
                                    }

    {Letras}{WhiteSpace}            {
                                        System.out.println("Encontre una palabra: " + yytext());
                                    }

/*Errores*/
    {Decimal}{WhiteSpace}           {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                        System.out.println("No deberian haber decimales en esta parte");
                                    }
    
    {Hexadecimal}{WhiteSpace}       {
                                        System.out.println("Error en la linea: " + (yyline+1));
                                        System.out.println("El error es: " + yytext());
                                        System.out.println("No deberian haber hexadecimales en esta parte");
                                    }

/*Cambio de estado*/
    {SaltoTaI}                      {
                                        yybegin(YYINITIAL);
                                    }
}

<COMENTARIO>
{
    {LineTerminator}                {
                                        yybegin
                                    }
}

.                                   { }

/* Ejecucion
    java -jar jflex.jar "archivo.flex"
*/