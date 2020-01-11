package codeGenerator;

/**
 *
 * @author Musa
 */

public class Banner extends Componet{
    protected String navID = "";
    
    public Banner(String navID)
    {
        this.navID = navID;
    }
    
    public Banner(){}
    
    public String getBanner()
    {
        return super.getComponet("banner");
    }
    
    public String getBanner(String bannerId)
    {
        return getComponet("banner", bannerId);
    }
    
     public String getBannersUrls()
    {
        
        return getComponetsUrls("banner");
    }
    
    public String getBannerUrl(String id)
    {
        return getComponetsUrl(id);
    }
     
    @Override
    public String toString()
    {
        return getBanner();
    }
}

class test{

    public static void main(String[] args) {
        System.out.println(new Banner().getBannerUrl("11"));
    }
}