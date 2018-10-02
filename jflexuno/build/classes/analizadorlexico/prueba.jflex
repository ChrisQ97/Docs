
package lexico;

%%

%class Numeros
%unicode
%public
%standalone

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [\t\f]
Decimal = 0 | [1-9][1-9]*
Hexadecimal = 0 | ([0-9]*[A-F]*)*
%%
{WhiteSpace}       {
                    System.out.println("Encontre un espacio");
                   }
{Decimal}          {
                    System.out.println("Encontre un numero --- > "+yytext();
                   }
{Hexadecimal}      {
                    System.out.println("Encontre un numero hexadecimal --- > "+yytext());
                   }


.                  {
                    System.out.println("Caracter no reconocido");
                   }
/*en linea de comando
ejecucion java -jar jflex.jar "archivo.flex"
*/