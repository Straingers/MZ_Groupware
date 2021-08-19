package com.spring.command;

import java.util.List;

import com.spring.dto.DepartmentVO;

/**
 * 사용처 : 전사관리 - 조직관리
 * 사용 용도 : tree.js depth 표시를 위해 사용 (마셜링/언마셜링)
 * @author 유은지
 */
public class OrganizationVO{	
	
	private DepartmentVO departmentVO; // 부서 정보
	
	private String text; // 조직 명
	private State state; // tree 상태 처리 여부(접기/펼치기 설정) (Key 로 들어가기 때문에 내부 Class로 생성)
	private String icon; // tree 내 아이콘 표시 설정
	private List<OrganizationVO> children; // dept_super(dept_code) 조회 시 하위 조직 저장 
		
	public DepartmentVO getDepartmentVO() {
		return departmentVO;
	}
	
	public void setDepartmentVO(DepartmentVO departmentVO) {
		this.departmentVO = departmentVO;
		this.text = departmentVO.getDeptName(); // deptVO 내 dept_Name을 text 로 설정
	}
	
	public String getText() {
		return text;
	}
//	public void setText(String text) {
//		this.text = text;
//	}
	public State getState() {
		return state;
	}
	public void setState(boolean opened) {
		this.state = new State(opened); // set status 시 Status 생성자에서 바로 넣을 수 있도록 값 추가
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public List<OrganizationVO> getChildren() {
		return children;
	}
	public void setChildren(List<OrganizationVO> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "OrganizationVO [departmentVO=" + departmentVO + ", text=" + text + ", state=" + state + ", icon=" + icon
				+ ", children=" + children + "]";
	}
	
}

class State{
	private boolean opened;
	public State(boolean opened) {
		super();
		this.opened = opened;
	}
	public boolean getOpened() {
		return opened;
	}
}
