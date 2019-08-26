package com.orsb2bgw.supporttool.Objects.dto;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;

@Component
public class UserDTO {
	
	@JsonView(Views.Public.class)
	private String username;
	@JsonView(Views.Public.class)
	private String password;
	@JsonView(Views.Public.class)
	private String userRole;
	@JsonView(Views.Public.class)
	private boolean enabled;
	
	private String siteName;
	
	private int result;

	

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public UserDTO(String username) {
		super();
		this.username = username;
	}
	
	public UserDTO()
	{
		
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public UserDTO(String username, String password, String userRole) {
		super();
		this.username = username;
		this.password = password;
		this.userRole = userRole;
	}
	
	public UserDTO(String username, String password) {
		super();
		this.username = username;
		this.password = password;
		
	}

	public UserDTO(String username, boolean enabled) {
		super();
		this.username = username;
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "UserDTO [username=" + username + ", password=" + password + ", userRole=" + userRole + ", enabled="
				+ enabled + ", siteName=" + siteName + "]";
	}

	

}
