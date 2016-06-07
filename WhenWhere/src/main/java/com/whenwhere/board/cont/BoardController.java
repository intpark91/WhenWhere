package com.whenwhere.board.cont;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping(value = "/notice")
	public String notice() {
		return "board/noticeBoard";
	}

	@RequestMapping(value = "/review")
	public String review() {
		return "board/reviewBoard";
	}

	@RequestMapping(value = "/event")
	public String event() {
		return "board/eventBoard";
	}

	@RequestMapping(value = "/eventWrite")
	public String eventWrite() {
		return "board/writeEvent";
	}

	@RequestMapping(value = "/write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value = "/noticeRead")
	public String noticeRead() {
		return "board/noticeBoardRead";
	}
	
	@RequestMapping(value = "/JSeditor")
	public String JSeditor() {
		return "board/JSeditor";
	}
	
	@RequestMapping(value = "/fileupload")
	public String fileupload() {
		return "board/fileupload";
	}
	
	@RequestMapping(value = "/ckeditorImageUpload")
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	
		OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Date date = new Date();
        int year = date.getYear() + 1900;
        int month = date.getMonth();
        long time = System.currentTimeMillis();
        String monthStr = "";
        if(month < 10) monthStr="0"+month;
        else monthStr = ""+month;
        
        try{
 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath = "c:/img/"  + year+""+monthStr+ time+ fileName;//저장경로 
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
            System.out.println(request.getServletContext().getContextPath());
            printWriter = response.getWriter();
            String fileUrl = "http://localhost:8888/img/" + year+""+monthStr +time + fileName;
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return;
		
	}
}
