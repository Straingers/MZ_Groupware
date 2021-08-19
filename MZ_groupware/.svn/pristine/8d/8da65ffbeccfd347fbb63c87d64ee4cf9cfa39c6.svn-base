package com.spring.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.dto.EmployeeVO;

public class User implements UserDetails {
	private static final long serialVersionUID = 1L;
	
	private EmployeeVO emp;
	
	public User(EmployeeVO emp) { 
		this.emp = emp;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(emp.getAuthority()));
		return roles;
	}

	@Override
	public String getPassword() {
		return emp.getEmpPwd();
	}

	@Override
	public String getUsername() {
		return emp.getEmpNo();
	}

	@Override
	public boolean isAccountNonExpired() { // 기간제 계정의 경우 기간만료 여부
		return !emp.getEmpStatus().equals("퇴직");
	}

	@Override
	public boolean isAccountNonLocked() { // 사용정지 혹은 휴먼계정
		return !emp.getEmpStatus().equals("휴직");
	}

	@Override
	public boolean isCredentialsNonExpired() { // 인증정보 만료 여부
		return !emp.getEmpStatus().equals("인증만료");
	}

	@Override
	public boolean isEnabled() { // 탈퇴 혹은 삭제
		return emp.getEmpStatus().equals("재직");
	}
	
	public EmployeeVO getEmployeeVO() {
		return this.emp;
	}

}
