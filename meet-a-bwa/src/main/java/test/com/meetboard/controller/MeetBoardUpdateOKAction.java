package test.com.meetboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import test.com.meetboard.model.MeetBoardDAO;
import test.com.meetboard.model.MeetBoardDAOImpl;
import test.com.meetboard.model.MeetBoardVO;

public class MeetBoardUpdateOKAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String sPath = request.getServletPath();
		
		System.out.println("UPDATE OK======================");
		
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String board_no = request.getParameter("board_no");
		
		System.out.println(board_no + " " +  board_title + " " + board_content);
		
		
		MeetBoardDAO dao = new MeetBoardDAOImpl();
		MeetBoardVO bvo = new MeetBoardVO();
		
		bvo.setBoard_title(board_title);
		bvo.setBoard_content(board_content);
		bvo.setBoard_no(board_no);
		
		int result = dao.board_update(bvo);

		if (result == 1) {
			System.out.println("update result!!!!");
			JSONObject obj = new JSONObject();			
			
			obj.put("board_no", bvo.getBoard_no());
			obj.put("board_title", bvo.getBoard_title());
			obj.put("board_content", bvo.getBoard_content());
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(obj);
		}
		
	}
}
