/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codeGenerator;

/**
 * This class creates the folders and files needed and create code file needed.
 * @author Musa
 */
import java.io.File;
import java.nio.file.*;
import java.nio.file.StandardCopyOption;
import java.util.Scanner;
import Cosc301.QueueAsLinkedList;
import Cosc301.Iterator;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FileManage {
    protected String fileLocation;
    protected String fileText;
    QueueAsLinkedList queue; 
  
    
    public FileManage(String fileLocation){
        this.fileLocation = fileLocation;
    }
    
    public FileManage(){}
        
    
    public QueueAsLinkedList readCode(){
        
        queue = new QueueAsLinkedList();
        
        try {
            File file = new File(fileLocation);
            
            Scanner input = new Scanner(file);
            input.useDelimiter("[\n]+");
            while (input.hasNext()) {
                queue.enqueue(input.next()+"\n");
            }  
            return queue;
        } catch (Exception e) {
            e.getMessage();
        }
        return null;
    }
    
    public String fileContent()
    {   
        String output = "";
        QueueAsLinkedList q = readCode();
        while(!q.isEmpty())
            output += (String)q.dequeue()+"\t";
        return output;
    }
    
     public void createFolder(String pathname){
       
        Path path = Paths.get(pathname);
        //if directory exists?
        if (!Files.exists(path)) {
            try {
                Files.createDirectories(path);
            } catch (IOException e) {
                //fail to create directory
                e.printStackTrace();
            }
        }
    }
     
    public void saveFile(String content){
     //This method will create a new file at the given path, or overwrite it if it already exists.   
        Path path = Paths.get(fileLocation);
        //if directory exists?
        try(BufferedWriter writer = Files.newBufferedWriter(path, Charset.forName("UTF-8"))){
            writer.write(content);
        }catch(IOException ex){
          ex.printStackTrace();
        }
    } 
    
    public void createFile(String pathname){
       
        Path path = Paths.get(pathname);
        //if directory exists?
        if (!Files.exists(path)) {
            try {
                Files.createFile(path);
            } catch (IOException e) {
                //fail to create directory
                e.printStackTrace();
            }
        }
    }
    
    public void createProjectFile(String projectID, String content)
    {
         //USE THE PROJECT ID FOR PROJECT FOLDER IN PATH.
         String folder = "C:\\htmlpagegenerator\\"+projectID;
         String indexFile = "C:\\htmlpagegenerator\\"+projectID+"\\index.html";
         createFolder(folder);
         createFile(indexFile);
         writeToFile(indexFile, content);

    }
    
    public void writeToFile(String filePath, String content)
    {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            
			bw.write(content);
			// no need to close it.
			//bw.close();
		} catch (IOException e) {
                    e.getMessage();
		}
    }
    
    public boolean isFileEmpty(){
        File file = new File(fileLocation);
        if (file.length() == 0)
            return false;
        return false;
    }
    
    //THIS METHOD CREATES AND ERROR FILE
    public void writeError(String erroName, String erro){
    }
}
/*
class testcfile{
    public static void main(String[] args) {
        String content = " ";
        new FileManage().createProjectFile("1",content);
        System.out.println("Directory created and files copied and text written");
    }
}
*/