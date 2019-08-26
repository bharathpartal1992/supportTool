package com.orsb2bgw.supporttool.Objects.dto;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;

@Component
public class WorkListDTO {

	
	  @JsonView(Views.Public.class)
	  private String protocol_Messageid=null;
	  private String conversation_Id = null;
	  @JsonView(Views.Public.class)
	  private String estimate_Number=null;
	  private String contract_Number=null;
	  private String nims_Id= null;
	  @JsonView(Views.Public.class)
	  private String supplier_Id = null;
	  @JsonView(Views.Public.class)
	  private String message_Code=null;
	  private String nims_Slip_Number=null;
	  private String supplier_Ref_Number= null;
	  @JsonView(Views.Public.class)
	  private String direction=null;
	  @JsonView(Views.Public.class)
	  private String timestamp=null;
	  private String status = null;
	  private String payload=null;
	  private String service=null;
	  private String action=null;
	  private String from_Role = null;
	  private String to_Role=null;
	  private String from_Date=null;
	  private String to_Date=null;
	  @JsonView(Views.Public.class)
	  private String keyType=null;
	  @JsonView(Views.Public.class)
	  private String key=null;
	  private String exceptionMessge=null;
	  @JsonView(Views.Public.class)
	  private String sender_MsgId=null;
	  @JsonView(Views.Public.class)
	  private String receiver_MsgId=null;
	  private String sortordertype=null;
	  private String sortmessageby=null;
	  private String recParPage  =  null;	  
	  private int    page_Number = 0;
	  private int    no_Record = 0;
	public WorkListDTO(){
		  
	  }
	  
	  public WorkListDTO(String estimate_Number, String supplier_Id, String message_Code, String timestamp,
				String direction, String keyType, String key, String sender_MsgId, String receiver_MsgId,
				String protocol_Messageid) {
			super();
			this.protocol_Messageid = protocol_Messageid;
			this.estimate_Number = estimate_Number;
			this.supplier_Id = supplier_Id;
			this.message_Code = message_Code;
			this.direction = direction;
			this.timestamp = timestamp;
			this.keyType = keyType;
			this.key = key;
			this.sender_MsgId = sender_MsgId;
			this.receiver_MsgId = receiver_MsgId;
		}

	@Override
	public String toString() {
		return "WorkListDTO [protocol_Messageid=" + protocol_Messageid + ", estimate_Number=" + estimate_Number
				+ ", supplier_Id=" + supplier_Id + ", message_Code=" + message_Code + ", direction=" + direction
				+ ", timestamp=" + timestamp + ", keyType=" + keyType + ", key=" + key + ", sender_MsgId="
				+ sender_MsgId + ", receiver_MsgId=" + receiver_MsgId + "]";
	}

	public String getProtocol_Messageid() {
		return protocol_Messageid;
	}

	public void setProtocol_Messageid(String protocol_Messageid) {
		this.protocol_Messageid = protocol_Messageid;
	}

	public String getConversation_Id() {
		return conversation_Id;
	}

	public void setConversation_Id(String conversation_Id) {
		this.conversation_Id = conversation_Id;
	}

	public String getEstimate_Number() {
		return estimate_Number;
	}

	public void setEstimate_Number(String estimate_Number) {
		this.estimate_Number = estimate_Number;
	}

	public String getContract_Number() {
		return contract_Number;
	}

	public void setContract_Number(String contract_Number) {
		this.contract_Number = contract_Number;
	}

	public String getNims_Id() {
		return nims_Id;
	}

	public void setNims_Id(String nims_Id) {
		this.nims_Id = nims_Id;
	}

	public String getSupplier_Id() {
		return supplier_Id;
	}

	public void setSupplier_Id(String supplier_Id) {
		this.supplier_Id = supplier_Id;
	}

	public String getMessage_Code() {
		return message_Code;
	}

	public void setMessage_Code(String message_Code) {
		this.message_Code = message_Code;
	}

	public String getNims_Slip_Number() {
		return nims_Slip_Number;
	}

	public void setNims_Slip_Number(String nims_Slip_Number) {
		this.nims_Slip_Number = nims_Slip_Number;
	}

	public String getSupplier_Ref_Number() {
		return supplier_Ref_Number;
	}

	public void setSupplier_Ref_Number(String supplier_Ref_Number) {
		this.supplier_Ref_Number = supplier_Ref_Number;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPayload() {
		return payload;
	}

	public void setPayload(String payload) {
		this.payload = payload;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getFrom_Role() {
		return from_Role;
	}

	public void setFrom_Role(String from_Role) {
		this.from_Role = from_Role;
	}

	public String getTo_Role() {
		return to_Role;
	}

	public void setTo_Role(String to_Role) {
		this.to_Role = to_Role;
	}

	public String getFrom_Date() {
		return from_Date;
	}

	public void setFrom_Date(String from_Date) {
		this.from_Date = from_Date;
	}

	public String getTo_Date() {
		return to_Date;
	}

	public void setTo_Date(String to_Date) {
		this.to_Date = to_Date;
	}

	public String getKeyType() {
		return keyType;
	}

	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getExceptionMessge() {
		return exceptionMessge;
	}

	public void setExceptionMessge(String exceptionMessge) {
		this.exceptionMessge = exceptionMessge;
	}

	public String getSender_MsgId() {
		return sender_MsgId;
	}

	public void setSender_MsgId(String sender_MsgId) {
		this.sender_MsgId = sender_MsgId;
	}

	public String getReceiver_MsgId() {
		return receiver_MsgId;
	}

	public void setReceiver_MsgId(String receiver_MsgId) {
		this.receiver_MsgId = receiver_MsgId;
	}

	public String getSortordertype() {
		return sortordertype;
	}

	public void setSortordertype(String sortordertype) {
		this.sortordertype = sortordertype;
	}

	public String getSortmessageby() {
		return sortmessageby;
	}

	public void setSortmessageby(String sortmessageby) {
		this.sortmessageby = sortmessageby;
	}

	public String getRecParPage() {
		return recParPage;
	}

	public void setRecParPage(String recParPage) {
		this.recParPage = recParPage;
	}

	public int getPage_Number() {
		return page_Number;
	}

	public void setPage_Number(int page_Number) {
		this.page_Number = page_Number;
	}

	public int getNo_Record() {
		return no_Record;
	}

	public void setNo_Record(int no_Record) {
		this.no_Record = no_Record;
	}
	  
		
	

}
