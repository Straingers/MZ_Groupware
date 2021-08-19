package com.spring.security;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.spring.dto.EmployeeVO;

public class UserLogoutSuccessHandler implements LogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		if (authentication != null && authentication.getDetails() != null) {
			User user = (User) authentication.getDetails();
			
			EmployeeVO loginUser = user.getEmployeeVO();
			
			logFile(loginUser, request);
            try {
                request.getSession().invalidate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("/mz");
	}

	private void logFile(EmployeeVO loginUser, HttpServletRequest request) throws IOException {
		// 로그인 정보를 스트링으로 저장.
		String tag = "[LOGOUT]";
		String log = tag 
				   + loginUser.getEmpNo() + ","
				   + loginUser.getDeptCode() + ","
				   + loginUser.getEmpPhone() + ","
				   + request.getRemoteAddr() + ","
					 + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		// 로그 파일 생성
		String savePath = "d:\\log";
		File file = new File(savePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String logFilePath = savePath + File.separator + "login_emp_log.csv";
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		// 로그를 기록
		out.write(log);
		out.newLine();
		
		if(out != null) out.close();
	}
	
}
