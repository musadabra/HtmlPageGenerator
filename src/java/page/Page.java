package page;


/**
 *
 * @author MUSA DABRA
 */
import codeGenerator.*;
import Cosc301.MyLinkedList;
import Cosc301.Association;
import Cosc301.Iterator;

public class Page {
    //protected MyLinkedList linkslist;
    protected String username = "";// get user name from session
    protected String userId = "";// get user id from session
    
    //RETURN THE TITLE OF PAGE.
    public String getTitle(String pageName)
    {
        MyLinkedList list = new MyLinkedList();
        Association ass;
        //list.append( new Association("gome.jsp", "Home page"));
        list.append( new Association("login.jsp", "Home page"));
        list.append( new Association("generator.jsp", "Choose from component"));
       // list.append( new Association("Home.jsp", "Home page"));
       // list.append( new Association("Home.jsp", "Home page"));
        
        Iterator it = list.iterator();
        while(it.hasNext()){
            Object obj = it.next();
            ass = (Association) obj;
            String key = (String)ass.getKey();
            if (key.equals(pageName)) {
                return (String) ass.getValue();
            }
        }
            
        return "";    
    }
    
}