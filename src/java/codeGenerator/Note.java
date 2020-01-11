package codeGenerator;

import java.sql.ResultSet;

/**
 *
 * @author MUSA DABRA
 */
import database.Db;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Note extends database.Db{
    String projId;
    Db db;
    public Note(String projId){
        this.projId = projId;
    }
    
    public Note(){}
    
    public String getNotes(String p_id){
        return selectNotes(p_id);
    }
    
    public String selectNotes(String projId){
        db = new Db();
        String query = "SELECT * FROM `note` WHERE p_id = "+projId;
        ResultSet rs = db.select(query);
        String output = ""; 
        try {
            while(rs.next()){
               int n_id = rs.getInt("note_id");
               int x = rs.getInt("x_pos");
               int y = rs.getInt("y_pos");
               String note = rs.getString("note");
               output += "<button id=\"note"+n_id+"\" style=\"position: absolute;z-index: 100;top: "+(y-30)+"px;left: "+(x - 162)+"px;\" type=\"button\" class=\"btn font-size-13px  note-signal note-button\" onclick=\"showNote('show-note"+n_id+"')\">Note</button>\n" +
"    <div id=\"show-note"+n_id+"\" class=\"show-note\" style=\"position: absolute;z-index: 100;top: "+y+"px;left: "+(x - 162)+"px;\" >\n" +
"     <div class=\"popnote hide-note\">\n" +
"        <div class=\"arrow\" style=\"top: 42px;\"></div>\n" +
"        <h3 class=\"popover-header\">Note By Client:</h3>\n" +
"        <div id=\"note"+n_id+"-body\" contenteditable=\"true\" class=\"popover-body\">"+note+"</div> \n" +
"        <div class=\"note-footer\">\n" +
"            <button id=\""+n_id+"\" style=\"padding: 5px 15px;margin-right: 10px;\" class=\"btn font-size-13px\" onClick=\"closeNote(this.id)\">Delete</button>\n" +
"            <button  style=\"padding: 5px 15px;background: #00a1e6;\" class=\"btn font-size-13px\" onclick=\"keepNote('note"+n_id+"-body')\">Save</button>\n" +
"        </div>\n" +
"    </div>\n" +
"    </div>";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Note.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return output;
    }
    
}

class testnote{
    public static void main(String[] args) {
        System.out.println(new Note().getNotes("1"));
    }
}
