package com.orsb2bgw.supporttool.Objects.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;

@Component
public class SearchDTO {
	
	@JsonView(Views.Public.class)
	private String key;
	
	@JsonView(Views.Public.class)
	private String senderMessageId;
	
	
	@JsonView(Views.Public.class)
	private String receiverMessageId;
	
	@JsonView(Views.Public.class)
	private String supplierId;
	
	@JsonView(Views.Public.class)
	@JsonFormat
    (shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date fromDate;
	
	
	
	@JsonView(Views.Public.class)
	@JsonFormat
    (shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date toDate;
	
	@JsonView(Views.Public.class)
	private String estimateNumber;
	
	@JsonView(Views.Public.class)
	private String contractNumber;
	
	@JsonView(Views.Public.class)
	private String messageCode;
	
	@JsonView(Views.Public.class)
	private String businessStatus;
	
	@JsonView(Views.Public.class)
	private String siteName;
	
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getSenderMessageId() {
		return senderMessageId;
	}

	public void setSenderMessageId(String senderMessageId) {
		this.senderMessageId = senderMessageId;
	}

	public String getReceiverMessageId() {
		return receiverMessageId;
	}

	public void setReceiverMessageId(String receiverMessageId) {
		this.receiverMessageId = receiverMessageId;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getEstimateNumber() {
		return estimateNumber;
	}

	public void setEstimateNumber(String estimateNumber) {
		this.estimateNumber = estimateNumber;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public String getMessageCode() {
		return messageCode;
	}

	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}

	public String getBusinessStatus() {
		return businessStatus;
	}

	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}

	
	
	
	
	
	
	@Override
	public String toString() {
		return "SearchDTO [key=" + key + ", senderMessageId=" + senderMessageId + ", receiverMessageId="
				+ receiverMessageId + ", supplierId=" + supplierId + ", fromDate=" + fromDate + ", toDate=" + toDate
				+ ", estimateNumber=" + estimateNumber + ", contractNumber=" + contractNumber + ", messageCode="
				+ messageCode + ", businessStatus=" + businessStatus + ", siteName=" + siteName + "]";
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public SearchDTO(String key, String senderMessageId, String receiverMessageId, String supplierId, Date fromDate,
			Date toDate, String estimateNumber, String contractNumber, String messageCode, String businessStatus) {
		super();
		this.key = key;
		this.senderMessageId = senderMessageId;
		this.receiverMessageId = receiverMessageId;
		this.supplierId = supplierId;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.estimateNumber = estimateNumber;
		this.contractNumber = contractNumber;
		this.messageCode = messageCode;
		this.businessStatus = businessStatus;
	}

	public SearchDTO(String senderMessageId, String receiverMessageId, String supplierId, Date fromDate, Date toDate,
			String estimateNumber, String contractNumber, String messageCode, String businessStatus) {
		super();
		this.senderMessageId = senderMessageId;
		this.receiverMessageId = receiverMessageId;
		this.supplierId = supplierId;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.estimateNumber = estimateNumber;
		this.contractNumber = contractNumber;
		this.messageCode = messageCode;
		this.businessStatus = businessStatus;
	}
	
	

	public SearchDTO(String key, String senderMessageId, String receiverMessageId, String supplierId, Date fromDate,
			Date toDate, String estimateNumber, String contractNumber, String messageCode, String businessStatus,
			String siteName) {
		super();
		this.key = key;
		this.senderMessageId = senderMessageId;
		this.receiverMessageId = receiverMessageId;
		this.supplierId = supplierId;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.estimateNumber = estimateNumber;
		this.contractNumber = contractNumber;
		this.messageCode = messageCode;
		this.businessStatus = businessStatus;
		this.siteName = siteName;
	}

	public SearchDTO()
	{
		
	}
	

}
