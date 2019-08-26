package com.orsb2bgw.supporttool.util;

import org.springframework.stereotype.Component;

@Component
public class ORSS_Constants {

    /** ORSS_Message_Detials  Table Column  Name  */
	public final static String KEY="KEY";
	public final static String ESTIMATE_NUMBER="ESTIMATE_NUMBER";
	public final static String CONTRACT_NUMBER="CONTRACT_NUMBER";
	public final static String SUPPLIER_ID="SUPPLIER_ID";
	public final static String MESSAGE_CODE="MESSAGE_CODE";
	public final static String NIMS_SLIP_NUMBER="NIMS_SLIP_NUMBER";
	public final static String SUPPLIER_REF_NUMBER="SUPPLIER_REF_NUMBER";
	public final static String DIRECTION="DIRECTION";
	public final static String MESSAGE_TIMESTAMP="MESSAGE_TIMESTAMP";
	public final static String RECEIPT_TIMESTAMP="RECEIPT_TIMESTAMP";
	public final static String STATUS="STATUS";
	public final static String EXCEPTIONMESSAGE="EXCEPTIONMESSAGE";
	public final static String PAYLOAD="PAYLOAD";
	public final static String KEYTYPE="KEYTYPE";
	public final static String PROTOCOL_MESSAGEID="PROTOCOL_MESSAGEID";
	public final static String CONVERSATION_ID="CONVERSATION_ID";
	public final static String NIMS_ID="NIMS_ID";
	public final static String RESUBMITTED_DATETIME="RESUBMITTED_DATETIME";
	public final static String SENDER_MSGID="SENDER_MESSAGEID";
	public final static String RECEIVER_MSGID="RECEIVER_MESSAGEID";
	/** Variable used to get the SortingOrderType*/
	public final static String SORTORDERTYPE="SORTORDERTYPE";
	public final static String MODIFIEDTIMESTAMPGMT="MODIFIED_TIMESTAMP_GMT";
		
	 /** B2B_INSTANCEMESSAGE  Table Column  Name  */
	public final static String B2BTIMESTAMP="B2BTIMESTAMP";
	public final static String PROTOCOLMESSAGEID="PROTOCOLMESSAGEID";
	
	 /** ORSS_RECEIPT_CORRELATION  Table Column  Name  */
	public final static String 	LET ="LET";
	public final static String  RESUBMISSION_COUNT="RESUBMISSION_COUNT";
	
	
	/** ORSS_SupplierID Table Column  Name  */
	public final static String ORSSSUPPLIER_ID="SUPPLIER_ID";
	
	/**  ORSS_Message_Code  Table Column  Name  */
	public final static String ORSSMESSAGE_CODE="MESSAGE_CODE";
	
	/**ORSS_SUPPORT_TOOL_USERS Table Column  Name  */
	public final static String USER_NAME="USER_NAME";
	public final static String PASS_WORD="PASS_WORD";
	public final static String ROLE="ROLE";
	
	/** ORSS_PROPERTY Table Column  Name  */
	public final static String PROPERTY_VALUE="PROPERTY_VALUE";
	public final static String PROPERTY_NAME="PROPERTY_NAME";
	
	public final static String  DEFAULT_SupplierID="DEFAULT";
	public final static String  BR_Status="Manual_Processed";
	public final static String  NIMSRoBT="NIMS-RoBT";
	public final static String  NIMSOR="NIMS-OR";
	public final static String  FROM_PARTY="FROM_PARTY";
	public final static String  TO_PARTY="TO_PARTY";
	public final static String  TO="To";
	public final static String  INBOUND="Inbound";
	public final static String  OUTBOUND="Outbound";
	public final static String  BUSINESS_RECEIPT="BusinessReceipt";
	public final static String  SupportToolProp="orssSupporttool";
	public final static String  SupportToolPropFileName="supporttool.properties";
	//public final static String  SupportToolPropPath="D://ORSGSUPPORTTOOL/orssSupporttool.properties";
	//public final static String  SupportToolPropPath="orssSupporttool.properties";

	public final static String  InboundPropPath="Inboundjmsprops.properties";
	public final static String  OutboundPropPath="Outboundjmsprops.properties";
	public final static String  NotificationFilePath="Notifications.txt";
	//public final static String  DBPROPFILEPATH="supporttoolDB.properties";
	public final static String  DBSITEFILEPATH="sitemapping.properties";
	
	//public final static String  BusinessReceiptFilePath="BusinessReceipt.xml";
	
}
