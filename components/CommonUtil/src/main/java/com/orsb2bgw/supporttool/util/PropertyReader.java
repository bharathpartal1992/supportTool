/**
 * * File         : PropertyReader.java
* Description  : TODO
* --------------------------------------------------------------------
*  Revision   	Author      			Date              comments
*--------------------------------------------------------------------
* 1.0         Tech Mahindra            Aug 2008         created
* --------------------------------------------------------------------
*  CopyRight    :Tech Mahindra,All Rights Reserved
*
 */

package com.orsb2bgw.supporttool.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.PropertyConfigurator;
import org.springframework.stereotype.Component;

@Component
public  class PropertyReader {
	
	 protected  Properties orssSupporttool =  null;
	 protected  Properties inboundprops =  null;
	 protected  Properties outboundprops = null;
	 protected  String initialPath=System.getProperty("PROP_HOME");

	 public static Properties getPropertiesInstance(String propfile) throws IOException
		{
		 PropertyReader property=new PropertyReader();
		 Properties props =  new Properties();
		 props=property.getProperty(propfile);
	     return props;
		}
	 
	 private  Properties getProperty(String propfile) throws IOException
		{
		 InputStream inputstream=null;
			if(propfile.equals(ORSS_Constants.INBOUND) && inboundprops==null)
			{
				inboundprops=new Properties();				 	 	
				if(initialPath==null)
					initialPath=System.getProperty("PROP_HOME");
				String finalPath=initialPath+ORSS_Constants.InboundPropPath;
				File temp = new File(finalPath);
				inputstream =  new FileInputStream(temp);
				 inboundprops.load(inputstream);
		            inputstream.close();
				 return inboundprops;
		        
			}else if(propfile.equals(ORSS_Constants.INBOUND)) 
				return inboundprops;
			
			if(propfile.equals(ORSS_Constants.OUTBOUND) && outboundprops==null)
			{
				 outboundprops=new Properties();
				 if(initialPath==null)
						initialPath=System.getProperty("PROP_HOME");
					//String initials=System.getProperty("PROP_HOME");
					String finalPath=initialPath+ORSS_Constants.OutboundPropPath;
					File temp = new File(finalPath);
					inputstream =  new FileInputStream(temp);
				    outboundprops.load(inputstream);
		            inputstream.close();
		            return outboundprops;
			}else if(propfile.equals(ORSS_Constants.OUTBOUND))
				return outboundprops;
			
			if(propfile.equals(ORSS_Constants.SupportToolProp) )
			{		
				
				orssSupporttool=new Properties(); 
				if(initialPath==null)
					initialPath=System.getProperty("PROP_HOME");
				//String initials=System.getProperty("PROP_HOME");
				String finalPath=initialPath+ORSS_Constants.SupportToolPropFileName;
				File temp = new File(finalPath);
				inputstream =  new FileInputStream(temp);
				orssSupporttool.load(inputstream);
				PropertyConfigurator.configure(orssSupporttool);
	            inputstream.close();
				return orssSupporttool;		        
			}else {
				
				return orssSupporttool;
			}
		}
	 
}
