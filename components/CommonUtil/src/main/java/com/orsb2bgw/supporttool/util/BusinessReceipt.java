package com.orsb2bgw.supporttool.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.StringTokenizer;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathException;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;
import com.orsb2bgw.supporttool.util.ORSS_Constants;
import com.sun.org.apache.xml.internal.serialize.OutputFormat;
import com.sun.org.apache.xml.internal.serialize.XMLSerializer;

@Component
public class BusinessReceipt {
	private XPath xpath = XPathFactory.newInstance().newXPath();
	private static B2BLogger logger=B2BLogger.getLogger(BusinessReceipt.class);
    public  String genarate_BusinessReceipt(WorkListDTO search,String key){
    	String businessReceipt="";
    	try {
    		
    		Properties properties=PropertyReader.getPropertiesInstance(ORSS_Constants.SupportToolProp);
    		String path=properties.getProperty("BUSINESS_RECEIPT");
    		String processID=getoriginatingProcessID(key);
    		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc=db.parse(path);
			Node fromDUNS = getNode(doc, "/e537/b2bHeader/fromDUNS");
			Node toDUNS = getNode(doc, "/e537/b2bHeader/toDUNS");
			Node senderMessageID = getNode(doc, "/e537/b2bHeader/senderMessageID");
			Node receiverMessageID = getNode(doc, "/e537/b2bHeader/receiverMessageID");
			Node originatingProcessID=getNode(doc,"/e537/b2bBody/mORSSBusinessReceipt/originatingProcessID");
			Node supplierReferenceNumber=getNode(doc,"/e537/b2bBody/mORSSBusinessReceipt/supplierReferenceNumber");
			Node nimsSlipNumber=getNode(doc,"/e537/b2bBody/mORSSBusinessReceipt/nimsSlipNumber");
			Node statusMessageDate=getNode(doc,"/e537/b2bBody/mORSSBusinessReceipt/statusMessageDate");
			
			fromDUNS.setTextContent(search.getNims_Id());
			toDUNS.setTextContent(search.getSupplier_Id());
			senderMessageID.setTextContent(search.getEstimate_Number()+"@"+new Date().getTime());
			receiverMessageID.setTextContent(search.getSender_MsgId());
			originatingProcessID.setTextContent(processID);
			supplierReferenceNumber.setTextContent(search.getSupplier_Ref_Number());
			nimsSlipNumber.setTextContent(search.getNims_Slip_Number());
			
			Date currentTime=new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SSS");
			statusMessageDate.setTextContent(formatter.format(currentTime));
			printToFile(doc,path);
			businessReceipt=ReadFile(path);
    	}catch(Exception e){
    		logger.error("Exception ",e);
    	}
    
    	
	   return businessReceipt;
	  
    }
  
  private String ReadFile(String path) {
		// TODO Auto-generated method stub
	  String currentline="";
	  String output="";
	  try(FileReader fi1=new FileReader(path);
			  BufferedReader buff1=new BufferedReader(fi1);) {
		    
			while((currentline=buff1.readLine())!=null){
				output=output+currentline+"\n";
			}
			
		} catch (Exception e) {
			logger.error("Exception", e);
		}
	  
		return output;
	}

private String getoriginatingProcessID(String key) {
		// TODO Auto-generated method stub
	  String[] processid=new String[3];
	  StringTokenizer  stringTokenzier=new StringTokenizer(key,"|") ;
	  int j=0;
		while(stringTokenzier.hasMoreElements()){
			processid[j]=stringTokenzier.nextToken();
			j++;
		}
		return processid[0];
	}

private  Node getNode(Document doc, String xpathExp) throws XPathException {
		String expression = xpathExp;
		Node node = (Node) xpath.evaluate(expression, doc, XPathConstants.NODE);
		if (node == null) {
			throw new XPathExpressionException("Requested Node not found");
		}
		
		return node;
	}
    private String printToFile(Document doc,String dest) throws IOException{

    	String filepath=dest;

    		try
    			{
    			OutputFormat format = new OutputFormat(doc);
    			format.setIndenting(true);	
    			XMLSerializer serializer = new XMLSerializer(
    			new FileOutputStream(new File(filepath)), format);
    			serializer.serialize(doc);			
    			} catch(IOException ie) {
    				logger.error("Exception", ie);
    			}
    			return filepath;
    }

}
