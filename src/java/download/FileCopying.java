/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package download;

import database.Db;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP PRO
*/
public class FileCopying {
    public List<File> files;
    File file;
    
    public FileCopying(){
        this.files = new ArrayList();
    }
    
    public void copyFile(String src, String dst){
        Path srcPath = Paths.get(src);
        Path dstPath = Paths.get(dst);
        
        try {
            Files.copy(srcPath, dstPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException ex) {
            Logger.getLogger(FileCopying.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void copyImages(String imageUrl, String destination){
        copyFile(imageUrl, destination);    
    }
}

  
/*
class testCopy{
    public static void main(String[] args) {
        String source = "C:\\Users\\HP PRO\\Documents\\NetBeansProjects\\HTMLPAGEBUILDER\\web\\Assets\\images\\banner2.PNG";
        //"c:\\htmlpagegenerator\\index.html"
       new FileCopying().copyFile(source, "c:\\test\\bg1.png");
       
    }
}*/