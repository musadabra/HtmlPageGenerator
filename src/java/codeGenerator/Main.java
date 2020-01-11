package codeGenerator;
/**
 *
 * @author HP PRO
 */
public class Main extends Componet{
    public String sectionID = "";
    
    public Main(String sectionID)
    {
        this.sectionID = sectionID;
    }
    
    public Main(){}
    
    public String getMain()
    {
        return getComponet("section");
    }
   
    public String getMain(String sectionID)
    {
        return getComponet("section", sectionID);
    }
    
    public String getMainsUrls()
    {
        return getComponetsUrls("main");
    }
    
    public String getMainUrl(String id)
    {
        return getComponetsUrl(id);
    }
    
    @Override
    public String toString()
    {
        return getMain();
    }
}