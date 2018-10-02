/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jflexuno;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import lexico.Numeros;

/**
 *
 * @author compiladores
 */
public class Jflexuno {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        Numeros scanner = null;
        try {
            // TODO code application logic here
            FileInputStream stream = new FileInputStream("src"+File.separator+"lexico"+File.separator+"datos.txt");
        
            Reader reader = new InputStreamReader(stream);
            scanner = new Numeros(reader);
            while ( !scanner.zzAtEOF ) scanner.yylex();
        } catch (FileNotFoundException ex) {
      
            Logger.getLogger(Jflexuno.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
