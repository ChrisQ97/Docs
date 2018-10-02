/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jflexuno;

import java.io.File;

/**{be}                {
                        System.out.println("hexadecimal---> "+yytext() );
                    }
 *
 * @author compiladores
 */
public class GenFlex {
    
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println(System.getProperty("user.dir"));
        jflex.Main.generate(new File("src"+File.separator+"analizadorlexico"+File.separator+"prueba.jflex"));
    }
    
}
