package codeGenerator;

/**
 *
 * @author Musa
 */
import Cosc301.MyLinkedList;

public class Header extends Componet{
    protected String headerId;
    
    public Header(String headerId)
    {
        this.headerId = headerId;
    }
    
    public Header(){}
    
    public String getHeader(String headerId){
        return getComponet("header", headerId);
    }
    
    public String getHeaders()
    {
        return getComponet("header");
    }
    
    public String getHeaderUrls()
    {
        return getComponetsUrls("header");
    }
    
     public String getHeaderUrl(String id)
    {
        return getComponetsUrl(id);
    }
    
    @Override
    public String toString()
    {
        return getHeaders();
    }
}
