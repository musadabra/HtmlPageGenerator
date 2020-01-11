package download;

/**
 *
 * @author Musa Dabra
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FolderZipper {
    ZipOutputStream zip;
    FileOutputStream fileWriter;
    String srcFolder;
    
    /*
    public FolderZipper(String srcFolder, String destZipFile) throws FileNotFoundException{
        zip = new ZipOutputStream(fileWriter);
        fileWriter = new FileOutputStream(destZipFile);
        this.srcFolder = srcFolder;
    }*/
    
    public FolderZipper(){}
    
    public void zipFolder(String srcFolder, String destZipFile) throws Exception {
        fileWriter = new FileOutputStream(destZipFile);
        zip = new ZipOutputStream(fileWriter);

        addFolderToZip("", srcFolder, zip);
        zip.flush();
        zip.close();
  }
    
 

  private void addFileToZip(String path, String srcFile, ZipOutputStream zip)
      throws Exception {

    File folder = new File(srcFile);
    if (folder.isDirectory()) {
      addFolderToZip(path, srcFile, zip);
    } else {
      byte[] buf = new byte[1024];
      int len;
      FileInputStream in = new FileInputStream(srcFile);
      zip.putNextEntry(new ZipEntry(path + "/" + folder.getName()));
      while ((len = in.read(buf)) > 0) {
        zip.write(buf, 0, len);
      }
    }
  }

  private void addFolderToZip(String path, String srcFolder, ZipOutputStream zip)
      throws Exception {
    File folder = new File(srcFolder);

    for (String fileName : folder.list()) {
      if (path.equals("")) {
        addFileToZip(folder.getName(), srcFolder + "/" + fileName, zip);
      } else {
        addFileToZip(path + "/" + folder.getName(), srcFolder + "/" + fileName, zip);
      }
    }
  }
    
}
/*
class folder{
    public static void main(String[] args) {
        
        try {
            new FolderZipper().zipFolder("c:\\htmlpagegenerator\\9", "c:\\htmlpagegenerator\\HTML-PAGE-GENERATOR.zip");
            //"c:\\htmlpagegenerator\\", "c:\\htmlpagegenerator\\HTML-PAGE-GENERATOR"
        } catch (Exception ex) {
            Logger.getLogger(folder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
*/