<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>


<%
request.setCharacterEncoding("utf-8");
String return1="";
String return2="";
String return3="";

String name = "";
if (ServletFileUpload.isMultipartContent(request)){
	ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
	uploadHandler.setHeaderEncoding("UTF-8");
	List<FileItem> items = uploadHandler.parseRequest(request);
	for (FileItem item : items) {
		if(item.getFieldName().equals("callback")) {
			return1 = item.getString("UTF-8");
		} else if(item.getFieldName().equals("callback_func")) {
			return2 = "?callback_func="+item.getString("UTF-8");
		} else if(item.getFieldName().equals("Filedata")) {
			if(item.getSize() > 0) {
			
                
                name = item.getName().substring(item.getName().lastIndexOf(File.separator)+1);
				String filename_ext = name.substring(name.lastIndexOf(".")+1);
				filename_ext = filename_ext.toLowerCase();
			   	String[] allow_file = {"jpg","png","bmp","gif"};
			   	int cnt = 0;
			   	for(int i=0; i<allow_file.length; i++) {
			   		if(filename_ext.equals(allow_file[i])){
			   			cnt++;
			   		}
			   	}
			   	if(cnt == 0) {
			   		return3 = "&errstr="+name;
			   	} else {
			   		
			   		
		    		String dftFilePath = request.getServletContext().getRealPath("/");
		
		    		String filePath = "C:/img/";
		    		
		    		
		    		
		    		File file = null;
		    		file = new File(filePath);
		    		if(!file.exists()) {
		    			file.mkdirs();
		    		}
		    		
		    		String realFileNm = "";
		    		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today= formatter.format(new java.util.Date());
					realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					
					String rlFileNm = filePath + realFileNm;
					
					
					
					InputStream is = item.getInputStream();
					OutputStream os=new FileOutputStream(rlFileNm);
					int numRead;
					byte b[] = new byte[(int)item.getSize()];
					while((numRead = is.read(b,0,b.length)) != -1){
						os.write(b,0,numRead);
					}
					if(is != null) {
						is.close();
					}
					os.flush();
					os.close();
				
		    		
		    		return3 += "&bNewLine=true";
                        
		    		return3 += "&sFileName="+ name;
		    		
		    		return3 += "&sFileURL=/img/"+realFileNm;
		   	
			   	}
			}else {
				  return3 += "&errstr=error";
			}
		}
	}
}
response.sendRedirect(return1+return2+return3);
%>
