/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codeGenerator;

/**
 *
 * @author Musa
 */
//import database.db;

public class Footer extends Componet{
    protected String footerID = "";
    
    public Footer(String footerID)
    {
        this.footerID = footerID;
    }
    
    public Footer(){}
    
    public String getFooters()
    {
        return getComponet("footer");
    }
    
    public String getFooter(String FooterID)
    {
        return getComponet("footer", FooterID);
    }
    
    public String getFootersUrls()
    {
        return getComponetsUrls("footer");
    }
    
    public String getFooterUrl(String id)
    {
        return getComponetsUrl(id);
    }
    
    @Override
    public String toString()
    {
        return getFooters();
    }
   
}
