package com.orsb2bgw.supporttool.Objects.dto;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("supportToolRequest")
@Scope("prototype")
public class SupportToolRequest {
	private Object request;
	private Object response;
	private String serviceAction;
	private String serviceMethod;
	private String currentSiteName;
	private int recordCount;
	public Object getRequest() {
		return request;
	}
	public void setRequest(Object request) {
		this.request = request;
	}
	public Object getResponse() {
		return response;
	}
	public void setResponse(Object response) {
		this.response = response;
	}
	public String getServiceAction() {
		return serviceAction;
	}
	public void setServiceAction(String serviceAction) {
		this.serviceAction = serviceAction;
	}
	public String getServiceMethod() {
		return serviceMethod;
	}
	public void setServiceMethod(String serviceMethod) {
		this.serviceMethod = serviceMethod;
	}
	public String getCurrentSiteName() {
		return currentSiteName;
	}
	public void setCurrentSiteName(String currentSiteName) {
		this.currentSiteName = currentSiteName;
	}
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
}
