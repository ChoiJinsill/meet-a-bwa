package test.com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutOKAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate(); //세션의 모든 속성을 삭제
		
		// 쿠키 전부 삭제
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i<cookies.length; i++){
			// 유효시간을 0초 설정 삭제하는 효과
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
		
		response.sendRedirect("/views/main/MAIN01.jsp");
//		request.getRequestDispatcher("/views/main/MAIN01.jsp").forward(request, response);
	}
}
