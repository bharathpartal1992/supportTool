/**                 
 * Copyright (c) 2006 BT 
 * All Rights Reserved. The software contained on this media is proprietary 
 * to and embodies the confidential technology of BT. 
 **/

package com.orsb2bgw.supporttool.util;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.stereotype.Component;

/**
 * This class acts a thin wrapper around the logging framework used
 * Currently this implementation uses Log4J.
 * 
 * @author Amit Damle
 */
@Component
public class B2BLogger 
{
	static{
		String log4jConfigFile="";
		/*if(System.getProperty("PROP_HOME")!=null){*/
			 log4jConfigFile= System.getProperty("PROP_HOME") + "log4j.properties";
		     PropertyConfigurator.configure(log4jConfigFile);
	/*	}
		else
			PropertyConfigurator.configure("/properties/log4j.properties");
		//System.out.println(log4jConfigFile+">>>>>>>>");
*/        
	}
	public B2BLogger() {
		
		
	}
    

	//The Log4j logger
	protected Logger logger;
	/**
	 * Constructor
	 * @param loggerName, The name that is used for displaying and configuration purposes
	 */
	protected B2BLogger(String loggerName)
	{
		logger = Logger.getLogger(loggerName);
	}
	
	/**
	 * Create a logger 
	 * @param name, The name that is used for displaying and configuration purposes
	 * @return the logger.
	 */
	public static B2BLogger getLogger(String name)
	{
		return new B2BLogger(name);		
	}

	/**
	 * Create a logger
	 * @param clazz, the classes name will be used for display and configuration purposes
	 * @return the logger
	 */
	public static B2BLogger getLogger(Class clazz)
	{	
		
		if(clazz != null)
		{
			return new B2BLogger(clazz.getName());
		}
		else
		{
			return new B2BLogger("Null");
		}	
	}
	/**
	 * Invoke a method at debug priority
	 * @param message, the message to be debugged
	 */
	public void debug(Object message)
	{
		if(logger.isDebugEnabled())
		{
			logger.debug(message);
		}
	}
	
	/**
	 * Invoke a method at info priority
	 * @param message, the message 
	 */
		
	public void info(Object message)
	{
		if(logger.isInfoEnabled())
		{
			logger.info(message);
		}
	}
	
	/**
	 * Invoke a method at warn priority
	 * @param message, the message 
	 */
	public void warn(Object message)
	{
		logger.warn(message);	
	}

	/**
	 * Invoke a method at error priority
	 * @param message, the message 
	 */	
	public void error(Object message)
	{
		logger.error(message);	
	}

	/**
	 * Debug message and an exception
	 * @param message, the message 
	 */
	
	public void debug(Object message,Throwable ex)
	{
		if(logger.isDebugEnabled())
		{
			logger.debug(message,ex);
		}
	}
	
	/**
	 * Invoke a method at info priority and an exception
	 * @param message, the message 
	 */
	public void info(Object message,Throwable ex)
	{
		if(logger.isInfoEnabled())
		{
			logger.info(message,ex);
		}
	}
	
	/**
	 * Invoke a method at warn priority and an exception
	 * @param message, the message 
	 */	
	public void warn(Object message,Throwable ex)
	{
		logger.warn(message,ex);
	}

	/**
	 * Invoke a method at error priority and an exception
	 * @param message, the message 
	 */	
	public void error(Object message,Throwable ex)
	{
		logger.error(message,ex);	
	}
	
	/**
	 * Invoke a method at debug priority and an exception
	 * @param message, the message
	 * @deprecated 
	 */		
	public void log(Object message,Throwable ex)
	{
		debug(message,ex);
	}
}
