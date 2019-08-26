package com.orsb2bgw.supporttool.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.jms.JmsException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.orsb2bgw.supporttool.util.B2BLogger;

@EnableWebMvc
@ControllerAdvice
public class ExceptionHandlingController {

	private static B2BLogger logger=B2BLogger.getLogger(ExceptionHandlingController.class);
	
	
	
	//@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="IOException occured")
	@ExceptionHandler(IOException.class)
	public String handleIOException(){
		logger.error("IOException handler executed");
		return "io_Error";
	}
	@ExceptionHandler(JmsException.class)
	public String handleJMSException(HttpServletRequest request, Exception ex){
		logger.info("JMSException Occured:: URL="+request.getRequestURL());
		return "jms_Error";
	}
	@ExceptionHandler(DataAccessException.class)
	public String handleSDatabaseException(HttpServletRequest request, Exception ex){
		logger.info("SQLException Occured:: URL="+request.getRequestURL());
		return "database_error";
	}
	@ExceptionHandler(FileNotFoundException.class)
	public String handleFileNotFoundException(){
		logger.error("IOException handler executed");
		return "io_Error";
	}
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(){
		logger.error("IOException handler executed");
		return "io_Error";
	}
	
	
  
}