
package lexico;

%%

%class Numeros
%unicode
%public
%standalone

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [\t\f]
Decim = 0 | [1-9][1-9]*
Decimal = [0-9][0-9]*
octa = [0-7]
octal = {octa}+[oO]
bin = 0|1
binario = {bin}+[bB]
inicio = 0[xX]
letras = [a-fA-F]
alfabeto = [a-zA-Z]+
Hexadecimal = 0[xX]({Decimal}|{letras})+

noletras = [g-zG-Z]
nonumero = ({Decimal}{letras}) | ({letras}{Decimal})| {letras} | ([1-7]*[8-9]+[1-7]*)+[oO] | ([0-1]*[2-9]+[0-1]*)+[bB] | 0[xX](({Decimal}|[a-fA-F])*[g-zG-Z]({Decimal}|[a-fA-F])*)+ 


malouno = ({Decimal}|{noletras}+)*
malodos = ({Decimal}|{octa}*|{noletras}*)*
numeros = {Decimal}|{octal}|{binario}|{Hexadecimal}

NoDecimal = ({Decimal}[a-zA-Z]+)+
SaltoIaH = \(
saltoHaI = \)
SaltoIaT = \{
saltoTaI = \)
SaltoComentario = #+
comentario = [0-9]|[a-zA-Z]|SaltoComentario|\{|\}|\(|\)




%state HEXA
%xstate BIN
%state COMENTARIO
%state LETRAS

%%
<YYINITIAL>
{

    /*nos movemos a comentarios*/
    {SaltoComentario}                       {
                                             yybegin(COMENTARIO);
                                            }
    /*malos*/
    ({numeros}*{nonumero}+{numeros}*)+      {
                                            System.out.println("Error en linea: " + (yyline+1));
                                            System.out.println(": " + yytext());
                                            }
    {Decimal}{WhiteSpace}                   {
                                            System.out.println("Decimal: " + yytext());
                                            }

    {SaltoIaH}                              {
                                            yybegin(HEXA);
                                            }
    {SaltoIaT}                              {
                                            yybegin(LETRAS);
                                            }



}
<HEXA>
{
    {SaltoComentario}                       {
                                            yybegin(COMENTARIO);
                                            }
    ({numeros}*{nonumero}+{numeros}*)+      {
                                            System.out.println("Error en linea: " + (yyline+1));
                                            System.out.println(": " + yytext());
                                            }
    {Hexadecimal}{WhiteSpace}               {
                                            System.out.println("Hexadecimal: " + yytext());
                                            }
    {saltoHaI}                              {
                                            yybegin(YYINITIAL);
                                            }                                     
}
<LETRAS>
{
    {SaltoComentario}                       {
                                            yybegin(COMENTARIO);
                                            }
    {alfabeto}{WhiteSpace}                  {
                                            System.out.println("Encontre una palabra: " + yytext());
                                            }
    {saltoTaI}                              {
                                            yybegin(YYINITIAL);
                                            }    
}
<COMENTARIO>
{
    {LineTerminator}                        {
                                                if(zzLexicalState==COMENTARIO){ System.out.println("\nEstoy en comentario");}
                                            yybegin(YYINITIAL);
                                            }
    {comentario}                            {
                                            System.out.print(yytext());
                                            }
}
/*en linea de comando
ejecucion java -jar jflex.jar "archivo.flex"
*/