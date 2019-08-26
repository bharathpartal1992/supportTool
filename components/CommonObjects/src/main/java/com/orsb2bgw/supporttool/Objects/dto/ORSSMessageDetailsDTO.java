package com.orsb2bgw.supporttool.Objects.dto;

import java.sql.Clob;
import java.sql.Timestamp;

import javax.persistence.Lob;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;

@Component
public class ORSSMessageDetailsDTO {
	
	
	private String key;

	private String keyType;

	private String protocolMessageId;
	
	private String conversationId;

	private String nimsId;
	@JsonView(Views.Public.class)
	private String estimateNumber;
	@JsonView(Views.Public.class)
	private String contractNumber;
	@JsonView(Views.Public.class)
	private String supplierId;
	@JsonView(Views.Public.class)
	private String messageCode;
	@JsonView(Views.Public.class)
	private String nimsSlipNumber;
	@JsonView(Views.Public.class)
	private String supplierRefNumber;
	
	@JsonView(Views.Public.class)
	private String direction;
	@JsonView(Views.Public.class)
	private String senderMessageId;
	@JsonView(Views.Public.class)
	private String receiverMessageId;
	@JsonView(Views.Public.class)
	private String status;
	@JsonView(Views.Public.class)
	private String exceptionMessageCode;
	@JsonView(Views.Public.class)
	private String messageTimeStamp;
	
	/*@JsonFormat
    (shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")*/
	@JsonView(Views.Public.class)
	private String receiptTimeStamp;
	
	@JsonView(Views.Public.class)
	@JsonFormat
    (shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp curTimeStamp;
	
	private Timestamp reSubmittedDateTime;
	@JsonView(Views.Public.class)
	private Clob payload;
	
	@JsonView(Views.Public.class)
	private String siteName;
	
	

	


	public Timestamp getCurTimeStamp() {
		return curTimeStamp;
	}


	public void setCurTimeStamp(Timestamp curTimeStamp) {
		this.curTimeStamp = curTimeStamp;
	}


	

	@Override
	public String toString() {
		return "ORSSMessageDetailsDTO [key=" + key + ", keyType=" + keyType + ", protocolMessageId=" + protocolMessageId
				+ ", conversationId=" + conversationId + ", nimsId=" + nimsId + ", estimateNumber=" + estimateNumber
				+ ", contractNumber=" + contractNumber + ", supplierId=" + supplierId + ", messageCode=" + messageCode
				+ ", nimsSlipNumber=" + nimsSlipNumber + ", supplierRefNumber=" + supplierRefNumber + ", direction="
				+ direction + ", senderMessageId=" + senderMessageId + ", receiverMessageId=" + receiverMessageId
				+ ", status=" + status + ", exceptionMessageCode=" + exceptionMessageCode + ", messageTimeStamp="
				+ messageTimeStamp + ", receiptTimeStamp=" + receiptTimeStamp + ", curTimeStamp=" + curTimeStamp
				+ ", reSubmittedDateTime=" + reSubmittedDateTime + ", payload=" + payload + ", siteName=" + siteName
				+ "]";
	}


	public ORSSMessageDetailsDTO(String key, String keyType, String protocolMessageId, String conversationId,
			String nimsId, String estimateNumber, String contractNumber, String supplierId, String messageCode,
			String nimsSlipNumber, String supplierRefNumber, String direction, String senderMessageId,
			String receiverMessageId, String status, String exceptionMessageCode, String messageTimeStamp,
			String receiptTimeStamp, Timestamp curTimeStamp, Timestamp reSubmittedDateTime, Clob payload,
			String siteName) {
		super();
		this.key = key;
		this.keyType = keyType;
		this.protocolMessageId = protocolMessageId;
		this.conversationId = conversationId;
		this.nimsId = nimsId;
		this.estimateNumber = estimateNumber;
		this.contractNumber = contractNumber;
		this.supplierId = supplierId;
		this.messageCode = messageCode;
		this.nimsSlipNumber = nimsSlipNumber;
		this.supplierRefNumber = supplierRefNumber;
		this.direction = direction;
		this.senderMessageId = senderMessageId;
		this.receiverMessageId = receiverMessageId;
		this.status = status;
		this.exceptionMessageCode = exceptionMessageCode;
		this.messageTimeStamp = messageTimeStamp;
		this.receiptTimeStamp = receiptTimeStamp;
		this.curTimeStamp = curTimeStamp;
		this.reSubmittedDateTime = reSubmittedDateTime;
		this.payload = payload;
		this.siteName = siteName;
	}


	public String getSiteName() {
		return siteName;
	}


	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}


	public ORSSMessageDetailsDTO(Clob payload)
	{
	
		this.payload=payload;
	}
	
	
	public ORSSMessageDetailsDTO(String key,String estimateNumber,String contractNumber,String supplierId,String messageCode, String nimsSlipNumber,
			String supplierRefNumber, String timestamp, String status, String senderMessageId, String receiverMessageId) {
		
		
		this.key=key;
		this.estimateNumber=estimateNumber;
		this.contractNumber=contractNumber;
		this.supplierId=supplierId;
		this.messageCode=messageCode;
		this.nimsSlipNumber=nimsSlipNumber;
		this.supplierRefNumber=supplierRefNumber;
		this.messageTimeStamp=timestamp;
		this.status=status;
		this.senderMessageId=senderMessageId;
		this.receiverMessageId=receiverMessageId;
		
	}
	
	
	
		



	public ORSSMessageDetailsDTO()
	{
		
	}
	
	public ORSSMessageDetailsDTO(String messageTimeStamp, String receiptTimeStamp, String direction, String errorMessage, String status,Timestamp curTimeStamp) {
		this.messageTimeStamp=messageTimeStamp;
		this.receiptTimeStamp=receiptTimeStamp;
		this.direction=direction;
		this.exceptionMessageCode=errorMessage;
		this.status=status;
		this.curTimeStamp=curTimeStamp;
	}


	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getKeyType() {
		return keyType;
	}
	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}
	public String getProtocolMessageId() {
		return protocolMessageId;
	}
	public void setProtocolMessageId(String protocolMessageId) {
		this.protocolMessageId = protocolMessageId;
	}
	public String getConversationId() {
		return conversationId;
	}
	public void setConversationId(String conversationId) {
		this.conversationId = conversationId;
	}
	public String getNimsId() {
		return nimsId;
	}
	public void setNimsId(String nimsId) {
		this.nimsId = nimsId;
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
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getMessageCode() {
		return messageCode;
	}
	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}
	public String getNimsSlipNumber() {
		return nimsSlipNumber;
	}
	public void setNimsSlipNumber(String nimsSlipNumber) {
		this.nimsSlipNumber = nimsSlipNumber;
	}
	public String getSupplierRefNumber() {
		return supplierRefNumber;
	}
	public void setSupplierRefNumber(String supplierRefNumber) {
		this.supplierRefNumber = supplierRefNumber;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getExceptionMessageCode() {
		return exceptionMessageCode;
	}
	public void setExceptionMessageCode(String exceptionMessageCode) {
		this.exceptionMessageCode = exceptionMessageCode;
	}
	public String getMessageTimeStamp() {
		return messageTimeStamp;
	}
	public void setMessageTimeStamp(String messageTimeStamp) {
		this.messageTimeStamp = messageTimeStamp;
	}
	public String getReceiptTimeStamp() {
		return receiptTimeStamp;
	}
	public void setReceiptTimeStamp(String receiptTimeStamp) {
		this.receiptTimeStamp = receiptTimeStamp;
	}
	public Timestamp getReSubmittedDateTime() {
		return reSubmittedDateTime;
	}
	public void setReSubmittedDateTime(Timestamp reSubmittedDateTime) {
		this.reSubmittedDateTime = reSubmittedDateTime;
	}
	public Clob getPayload() {
		return payload;
	}
	public void setPayload(Clob payload) {
		this.payload = payload;
	}
	
	

}
