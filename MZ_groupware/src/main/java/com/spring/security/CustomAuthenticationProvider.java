package com.spring.security;

import java.sql.SQLException;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.dto.EmployeeVO;
import com.spring.service.EmployeeService;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	private EmployeeService employeeService;
	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String) auth.getPrincipal();
		String login_pwd = (String) auth.getCredentials(); // 로그인 시도한 Password를 가져온다.
		
		EmployeeVO employee = null;
		try {
			employee = employeeService.getEmployee(login_id);
		} catch (SQLException e) {
			throw new AuthenticationServiceException("Internal server error!");
		}
		
		UserDetails authUser = new User(employee);
		
		if(employee != null && login_pwd.equals(employee.getEmpPwd())) { //&& authUser.isEnabled()
			
			// 스프링 시큐리티 내부 클래스로 인증토큰을 생성한다.
			UsernamePasswordAuthenticationToken result 
						 = new UsernamePasswordAuthenticationToken(authUser.getUsername()
								 								 , authUser.getPassword()
								 								 , authUser.getAuthorities()
								 								 );
			
			// 전달할 내용 설정
			result.setDetails(authUser);
			
			// 리턴, successHandler로 전송된다.
			return result;
		} else {
			throw new BadCredentialsException("사번 혹은 비밀번호가 불일치합니다.");
		}
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}
