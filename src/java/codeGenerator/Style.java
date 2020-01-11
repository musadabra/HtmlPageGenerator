package codeGenerator;

/**
 *
 * @author MUSA DABRA
 */
import Cosc301.*;
import codeGenerator.FileManage;


public class Style {
    FileManage cssFile;
    public Style(String location)
    {
        cssFile = new FileManage(location);
    }
    
    public MyLinkedList elementsStyle()
    {
       
          String code = cssFile.fileContent();
          MyLinkedList styleslist = new MyLinkedList();
          
          if(!cssFile.isFileEmpty()){
            //String[] codeSegment = code.split("/(#|\n*#)/");
            String[] codeSegment = code.split("\\s*#");

            for (int i = 1; i < codeSegment.length; i++) {

                //System.out.println("CONTENT SEGMENT: "+i+"--"+codeSegment[i]);

                //int beginOfId = codeSegment[i].indexOf("#");
                int endOfId = codeSegment[i].indexOf("{");
                int endOfProperties = codeSegment[i].indexOf("}");
               // System.out.println(codeSegment[i]);
                //String key =  codeSegment[i].trim().substring(0, endOfId);
                String value = codeSegment[i].substring(endOfId+1, endOfProperties);
                String[] st = codeSegment[i].split("[{]");
                String key =  st[0];
             
                Association elements = new Association(new String(key), value);
                styleslist.append(elements);

            }
        }
        return styleslist;
    }
    
   
  
     //WRITE STYLE 
public MyLinkedList writeStyle(String style){
        
        //TOKENIZE STYLE( e.g #text{color:red;} ) INTO ID, PROPERTY, VALUE
        String id = style.substring(1, style.indexOf("{"));
        String property = style.substring(style.indexOf("{")+1, style.indexOf(":"));
        String value = style.substring(style.indexOf(":")+1, style.indexOf(";"));
       
        
        //Temp STORAGE CONTAINER
        MyLinkedList store = new MyLinkedList();
        
        //STYLES LIST FROM CSSFILE AS KEY(ID) AND VALUE(PROPERTY : VALUE)
        MyLinkedList list = elementsStyle();
        Iterator it = list.iterator();
        
        //TEMPORARY STORAGE FOR EACH KEY AND IT VALUE DURING ITERARION
        String key;
        String styleValue;
        
        //WHILE ITERATION IF ID EXIST CONTAINER. SET TO TRUE.
        boolean idExist = false; 
        
        //ITERATE TROUGHT KEYS AND CHECK THE EXISTANCE OF ID
        while(it.hasNext()){
            //TAKING EACH OBJECT IN LIST
            Object obj = it.next();
            //STORING KEY AND VALUE OF EACH ASSOSIATIVE OBJECT.
            Association asso = (Association)obj;
            styleValue = (String)asso.getValue();
            key = (String)asso.getKey();
           
            //IF ID EXIST          
            if(key.equalsIgnoreCase(id)){
               
              idExist = true;  
             //CHECK THE EXISTANCE OF PROPERTY
             //EXTRACT THE WHOLE OBJECT FROM CONTAINER
                list.extract(obj);
                String keyValue = (String)asso.getValue();
                
                //IF PROPERTY EXIST
                
                /* lOGICAL ERROR HERER, USING CONTAIN WE CAN HAVE
                   MARGIN-TOP IN PROPERTY AND WE CAN MEAN TOP, THIS CAN 
                   RETURN TRUE... UH!!
                */
                
                //BECAUSE SOMETIMES WE DONT GET TO KNOW WHEITHER THER PROPERTY EXIST IN KEYVALUE
                //UNTIL WE ITERATE THROUGH THE STYLES PROPER. E.G IF WE HAVE MARGIN-TOP, CONTAIN() CAN RETURN TRUE IF 
                //TOP IS PASSED TO IT
                boolean dontContain = true;
                
                if( keyValue.contains(property) ){
                   
                    // REPLACE VALUE
                    String[] splitLines = keyValue.split(";");
                   
                    String lines = "";
                  
                    for ( String line : splitLines ) {
                      
                        if( line.contains(property) ){
                            
                            String[] rp = line.split(":");
                            
                            if( rp[0].trim().equalsIgnoreCase(property.trim()) ){
                               
                                dontContain = false;  
                                line = rp[0]+":"+value+";";
                                
                            }
                            
                        }
                        lines += line;
                    }
                    
                    String newKeyValue = "";
                    newKeyValue += lines;
                       
                    //REPLACE OLD STYLE WITH THE NEW ONE.
                    keyValue = newKeyValue;
                    
                }
                
                if(dontContain){
                       keyValue += property+":"+value+";";
                       
                }
                String newKey = "#"+key;
                store.append(new Association(new String(key), keyValue));
            }
        }// END OF ITERATION
            if (!idExist) {
                
                String newValue = "\n\t\t"+property+":"+value+";";
               // String newId = id;
                store.append(new Association(new String(id), newValue));
               
            }
        //WRITE BACK THE NEW CODE
          Iterator i = store.iterator();
          while(i.hasNext()){
              list.append(i.next());
          }
          
      return list;
}

 public void saveStyle(MyLinkedList list){
  // TAKE LIST CONTENT AND PUT INTO STRING
          String newCode = "";
          Iterator iterateList = list.iterator();
          while(iterateList.hasNext()){
              Object obj = iterateList.next();
              Association asso = (Association)obj;
              
              newCode += "#"+(String)asso.getKey()+"{"+asso.getValue()+"\n}\n";
          }
          //System.out.println(newCode);
          cssFile.saveFile(newCode);
 }

}
/*
class testStyle{
    public static void main(String[] args) {
        Style style = new Style("C:\\test\\projects\\1\\Assets\\css\\custom-style.css");
        MyLinkedList list = style.elementsStyle();
        Iterator it = list.iterator(); 
        
        System.out.println("BEFORE MAKING CHANGES:");
        while(it.hasNext()){
            Object obj = it.next();
            Association asso = (Association)obj;
            System.out.println(asso.getKey()+" VALUE: "+asso.getValue());
        }
        
        System.out.println("-----------\nAFTER MAKING CHANGES:");
        MyLinkedList secondlist = style.writeStyle("#footer{width:100;}");
     
        style.saveStyle(secondlist);
        
       
        
            
        }
            
    }
*/
