package test.com.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainInitAction {
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
		}
	}
}
