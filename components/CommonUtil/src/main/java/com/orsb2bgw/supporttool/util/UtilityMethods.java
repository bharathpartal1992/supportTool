package com.orsb2bgw.supporttool.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TimeZone;

import org.springframework.stereotype.Component;

@Component
public class UtilityMethods {
	
	//static Set<String> siteList=new HashSet<String>();
	static int resubmitCount=0;
	static int removeCount=0;
	public static int getResubmitCount() {
		return resubmitCount;
	}
	public static void setResubmitCount(int resubmitCount) {
		UtilityMethods.resubmitCount = resubmitCount;
	}
	public static int getRemoveCount() {
		return removeCount;
	}
	public static void setRemoveCount(int removeCount) {
		UtilityMethods.removeCount = removeCount;
	}
	static Map<String,String> siteMap=new HashMap<String, String>();
	static Map<String,String> queueMap=new HashMap<String, String>();
	static Map<String,String> siteStatusMap=new HashMap<String, String>();
	private static B2BLogger logger=B2BLogger.getLogger(UtilityMethods.class);
	
	public static int getLimitCount() throws IOException{
		int count=0;
		Properties properties=new Properties();
		String initialPath=System.getProperty("PROP_HOME");
		String finalPath=initialPath+ORSS_Constants.SupportToolPropFileName;
		File temp = new File(finalPath);
		InputStream inputstream=null;
		
		try {
			 inputstream=  new FileInputStream(temp);
			properties.load(inputstream);
			count=Integer.parseInt((String)properties.get("MAX_ALLOWED_DISPLAY_RECORD_COUNT"));
		} catch (IOException e) {
			
			logger.error("Error in reading Property file",e);
		}finally{
			if(inputstream!=null)
				inputstream.close();
		}
		//System.out.println(count);
		return count;
	}
	public static Map<String,String> getSiteNames() throws IOException{
		
		siteMap.clear();
		siteStatusMap.clear();
		Properties properties=new Properties();
		String initialPath=System.getProperty("PROP_HOME");
		String finalPath=initialPath+ORSS_Constants.SupportToolPropFileName;
		File temp = new File(finalPath);
		InputStream inputstream=null;
		String value=null;
		String[] s1=null;
		
		try {
			inputstream =  new FileInputStream(temp);
			properties.load(inputstream);
			Set<Object> keys = getAllKeys(properties);
	        for(Object k:keys){
	            String key = (String)k; 
	            if(k.equals("site1") || k.equals("site2")){
	            value=getPropertyValue(key, properties);
	            if(value!=null)
	            	s1=value.split(",");  
	            siteMap.put(key, s1[0]);
	            siteStatusMap.put(key, s1[1]);
	            }

	            }
	        
	
			
		} catch (IOException e) {
			
			logger.error("Error in reading Property file",e);
		} finally{
			if(inputstream!=null)
			inputstream.close();
		}
		
		
		return siteMap;
	}
	 public static Set<Object> getAllKeys(Properties prop){
	        Set<Object> keys = prop.keySet();
	        return keys;
	    }
	     
	    public static String getPropertyValue(String key,Properties prop){
	        return prop.getProperty(key);
	    }
	
	public static Map<String,String> getQueueJNDIMap() throws IOException{
		queueMap.clear();
		Properties properties=new Properties();
		String initialPath=System.getProperty("PROP_HOME");
		String finalPath=initialPath+"supporttool.properties";
		File temp = new File(finalPath);
		InputStream inputstream=null;
		
		try {
			inputstream =  new FileInputStream(temp);
			properties.load(inputstream);
			Set<Object> keys = getAllKeys(properties);
	        for(Object k:keys){
	            String key = (String)k; 
	            String value=getPropertyValue(key, properties);
	            queueMap.put(key, value);
	        }
	
			
		} catch (IOException e) {
			
			logger.error("Error in reading Property file",e);
		} finally{
			if(inputstream!=null)
			inputstream.close();
		}
		
		return queueMap;
		
	}
	public Date getLET(String RESUBMISSION_INTERVAL,Timestamp Resubmitted_Timestamp){
		logger.debug("Enter getLET of Utility Class");  
		int interval=Integer.parseInt(RESUBMISSION_INTERVAL);
		Date LET=new Date(); 
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(Resubmitted_Timestamp.getTime());
		cal.add(Calendar.MINUTE, interval);
		LET=cal.getTime(); 
		logger.debug("Exit getLET of Utility Class");
		return LET;
	}
	
	public String generateId()throws java.net.UnknownHostException
	{
		String uniqueID = "";
        String hostName = null;

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");         
        String timeStamp = df.format(new Date());

        try {
                        hostName = InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException exception) {
                        try {
                                        logger.error(exception);
                                        throw new Exception(exception);
                        } catch (Exception e) {
                                        // TODO Auto-generated catch block
                        //            e.printStackTrace();
                                        logger.error(e.getMessage());
                        }
        }
        String rmiServerUID = new java.rmi.server.UID().toString();
        // replaceAll method is being called as a workaround for an issue with Oracle 11g B2B
        rmiServerUID = rmiServerUID.replaceAll(":", ".");
        uniqueID = timeStamp + "." + rmiServerUID + "." + hostName;
        return uniqueID.trim();   
        
	}

public String generateMsgId(String existingProtocolMEssageID ) throws UnknownHostException {
        
        
        String[] s1=existingProtocolMEssageID.split("@");
		return "M"+s1[0].substring(1, s1[0].indexOf("."))+"."+this.generateId()+"@"+s1[1];
}

  public String generateConversationId(String existingProtocolMEssageID) throws UnknownHostException {
        // TODO Auto-generated method stub
    	String[] s1=existingProtocolMEssageID.split("@");
		return "C"+s1[0].substring(1, s1[0].indexOf("."))+"."+this.generateId()+"@"+s1[1];
}

	
	
	public String getIpxml(Clob xml) throws SQLException, IOException{
		Reader r = null;
		String ipXMLString ="";
		int ch;
		try{ 
			if (xml != null) {
				r = xml.getCharacterStream();
				while ((ch = r.read()) != -1) {
					ipXMLString += String.valueOf((char) ch);
				}
				r = null;

			}
		}catch(Exception e){
			logger.error("Exception",e);

		}
		return ipXMLString.trim();
	}
	
	public static String getTextAsString(String filePath) throws IOException{
		//System.out.println(filePath);
		String line="";
		String temp="";
		
		try {
            FileReader reader = new FileReader(filePath);
            BufferedReader bufferedReader = new BufferedReader(reader);
 
            //line=bufferedReader.readLine();
 
            while ((temp = bufferedReader.readLine()) != null) {
                line=line+temp;
            }
            //System.out.println(line);
            reader.close();
 
        } catch (IOException e) {
        	logger.error("Exception",e);
        	throw e;
        	
        }
		return line;
		
	}
	public static Map<String, String> getSiteMap() {
		return siteMap;
	}
	public static void setSiteMap(Map<String, String> siteMap) {
		UtilityMethods.siteMap = siteMap;
	}
	public static Map<String, String> getSiteStatusMap() {
		return siteStatusMap;
	}
	public static void setSiteStatusMap(Map<String, String> siteStatusMap) {
		UtilityMethods.siteStatusMap = siteStatusMap;
	}


	public static String convertDateToGMT(Date receivedDate)  
       {
           DateFormat gmtFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           TimeZone gmtTime = TimeZone.getTimeZone("GMT");
           gmtFormat.setTimeZone(gmtTime);
           return gmtFormat.format(receivedDate);
       }


}