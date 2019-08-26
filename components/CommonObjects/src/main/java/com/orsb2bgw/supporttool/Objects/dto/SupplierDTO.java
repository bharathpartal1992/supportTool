package com.orsb2bgw.supporttool.Objects.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;

@Component
public class SupplierDTO {
	@JsonView(Views.Public.class)
	private String supplierId;
	private String userName;
	private Timestamp insertionTime;
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Timestamp getInsertionTime() {
		return insertionTime;
	}
	public void setInsertionTime(Timestamp insertionTime) {
		this.insertionTime = insertionTime;
	}
	public SupplierDTO(String supplierId) {
		super();
		this.supplierId = supplierId;
	}
	public SupplierDTO()
	{
		
	}
	
	public SupplierDTO(String supplierId, String userName, Timestamp insertionTime, String siteName) {
		super();
		this.supplierId = supplierId;
		this.userName = userName;
		this.insertionTime = insertionTime;
		this.siteName = siteName;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}


	private String siteName;
	@Override
	public String toString() {
		return "SupplierDTO [supplierId=" + supplierId + ", userName=" + userName + ", insertionTime=" + insertionTime
				+ ", siteName=" + siteName + "]";
	}
	
	
	
	

}
