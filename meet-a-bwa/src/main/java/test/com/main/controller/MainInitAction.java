package test.com.main.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import test.com.meet.model.MeetDAO;
import test.com.meet.model.MeetDAOImpl;
import test.com.meet.model.MeetVO2;

public class MainInitAction {
	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        
		boolean isLogin =  Boolean.parseBoolean(request.getParameter("isLogin"));
		
		// ����ڰ� �α����ϰ� ���������� �ε����� ��
		if(isLogin) {
			System.out.println("isLogin : true");
			String userInterest = request.getParameter("userInterest");
			String userRegion = request.getParameter("userRegion");
			
			if(userInterest.equals("")) {
				// ����� �������� �α⸹�������� �ִ� 10�� ����Ʈ ����
				System.out.println("�޾ƿ� ���ɻ� ������ �����ϴ�.");
			}else {
				// ����� ���ɻ翡 �´� ����Ʈ �α⸹�������� �ִ� 10�� ����Ʈ ����
			}
		}else { // ����ڰ� �α��������ʰ� ���������� �ε����� ��
			// �α⸹���� ������������ �ִ� 10�� ��õ
			System.out.println("false");
			
			MeetDAO dao = new MeetDAOImpl();
			List<MeetVO2> list = dao.select_like();
			JSONObject obj_wrap = new JSONObject();
			JSONArray arr = new JSONArray();
			
			for(MeetVO2 vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("meet_no", vo.getMeet_no());
				obj.put("meet_name", vo.getMeet_name());
				obj.put("meet_description", vo.getMeet_description());
				
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String date = transFormat.format(vo.getMeet_date());
				
				obj.put("meet_date", date);
				obj.put("user_no", vo.getUser_no());
				obj.put("like_cnt", vo.getLike_cnt());

				arr.add(obj);
			}
			
			obj_wrap.put("list_length", list.size());
			obj_wrap.put("list", arr);
			System.out.println(obj_wrap);
			

			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(obj_wrap);
			
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("/views/main/MAIN01.jsp").forward(request, response);
		}
	}
}
