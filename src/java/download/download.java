    package demotest;
     
    import java.io.FileInputStream;
    import java.io.IOException;
    import java.io.PrintWriter;
  
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    
    public class download extends HttpServlet {
    	private static final long serialVersionUID = 1L;
        public String fileName;
        public String filePath;
     
        public void setFileName(String name){
            fileName = name;
        }
                
        public void setFilePath(String path){
            filePath = path;
        }
        
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
            response.setContentType("text/html");
    		PrintWriter out = response.getWriter();
    		String gurufile = fileName;//"datayourFileName.png";
    		String gurupath = filePath;//"c:/test/";
    		response.setContentType("APPLICATION/OCTET-STREAM");
    		response.setHeader("Content-Disposition", "attachment; filename=\""
    				+ gurufile + "\"");
     
    		FileInputStream fileInputStream = new FileInputStream(gurupath
    				+ gurufile);
     
    		int i;
    		while ((i = fileInputStream.read()) != -1) {
    			out.write(i);
    		}
    		fileInputStream.close();
    		out.close();
    	}
     
     
    	/**
    	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    	 */
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		// TODO Auto-generated method stub
    	}
     
    }

class testDownload{
    
}