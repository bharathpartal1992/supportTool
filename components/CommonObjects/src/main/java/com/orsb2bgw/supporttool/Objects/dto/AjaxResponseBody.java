package com.orsb2bgw.supporttool.Objects.dto;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;


public class AjaxResponseBody {



	@JsonView(Views.Public.class)
	String msg;
	@JsonView(Views.Public.class)
	String code;
	@JsonView(Views.Public.class)
	List<SupplierDTO> result;
	@JsonView(Views.Public.class)
	List<ORSSMessageDetailsDTO> messageDetails;
	@JsonView(Views.Public.class)
	List<ORSSMessageStatusDTO> statusDetails;
	@JsonView(Views.Public.class)
	SearchDTO searchCriteria;
	@JsonView(Views.Public.class)
	ORSSMessageDetailsDTO singlemessageDetail;
	@JsonView(Views.Public.class)
	@javax.xml.bind.annotation.XmlTransient
	char clobVal[];
	@JsonView(Views.Public.class)
	@JsonFormat
    (shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	Timestamp currTimeStamp;
	@JsonView(Views.Public.class)
	int reSubCount;
	@JsonView(Views.Public.class)
	int messageResubmittedCount;
	@JsonView(Views.Public.class)
	List<WorkListDTO> resultWorklist;
	@JsonView(Views.Public.class)
	List<UserDTO> users;
	
	@JsonView(Views.Public.class)
	int searchResultCount;
	
	@JsonView(Views.Public.class)
	int siteStatus;
	
	
	
	
	
	public int getSiteStatus() {
		return siteStatus;
	}

	public void setSiteStatus(int siteStatus) {
		this.siteStatus = siteStatus;
	}

	public List<UserDTO> getUsers() {
		return users;
	}

	public void setUsers(List<UserDTO> users) {
		this.users = users;
	}

	public List<ORSSMessageDetailsDTO> getMessageDetails() {
		return messageDetails;
	}

	public void setMessageDetails(List<ORSSMessageDetailsDTO> messageDetails) {
		this.messageDetails = messageDetails;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<SupplierDTO> getResult() {
		return result;
	}

	public void setResult(List<SupplierDTO> result) {
		this.result = result;
	}
	
	

	public SearchDTO getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(SearchDTO searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	

	

	
	public int getReSubCount() {
		return reSubCount;
	}

	public void setReSubCount(int reSubCount) {
		this.reSubCount = reSubCount;
	}
	
	
	
	public int getMessageResubmittedCount() {
	
		return messageResubmittedCount;
	}

	public void setMessageResubmittedCount(int messageResubmittedCount) {
		this.messageResubmittedCount = messageResubmittedCount;
	}
	

	
	public List<ORSSMessageStatusDTO> getStatusDetails() {
		return statusDetails;
	}

	public void setStatusDetails(List<ORSSMessageStatusDTO> statusDetails) {
		this.statusDetails = statusDetails;
	}

	public List<WorkListDTO> getResultWorklist() {
		return resultWorklist;
	}

	public void setResultWorklist(List<WorkListDTO> resultWorklist) {
		this.resultWorklist = resultWorklist;
	}

	public char[] getClobVal() {
		return clobVal;
	}

	public void setClobVal(char[] clobVal) {
		this.clobVal = clobVal;
	}

	public ORSSMessageDetailsDTO getSinglemessageDetail() {
		return singlemessageDetail;
	}

	public void setSinglemessageDetail(ORSSMessageDetailsDTO singlemessageDetail) {
		this.singlemessageDetail = singlemessageDetail;
	}

	public int getSearchResultCount() {
		return searchResultCount;
	}

	public void setSearchResultCount(int searchResultCount) {
		this.searchResultCount = searchResultCount;
	}

	@Override
	public String toString() {
		return "AjaxResponseBody [msg=" + msg + ", code=" + code + ", result=" + result + ", messageDetails="
				+ messageDetails + ", statusDetails=" + statusDetails + ", searchCriteria=" + searchCriteria
				+ ", singlemessageDetail=" + singlemessageDetail + ", clobVal=" + Arrays.toString(clobVal)
				+ ", currTimeStamp=" + currTimeStamp + ", reSubCount=" + reSubCount + ", messageResubmittedCount="
				+ messageResubmittedCount + ", resultWorklist=" + resultWorklist + ", users=" + users
				+ ", searchResultCount=" + searchResultCount + "]";
	}



	
	

	
}
