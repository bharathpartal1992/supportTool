package com.orsb2bgw.supporttool.process.impl;

import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.orsb2bgw.supporttool.Objects.dto.SupportToolRequest;
import com.orsb2bgw.supporttool.dao.AuditDao;
import com.orsb2bgw.supporttool.dao.impl.AuditDaoImpl;
import com.orsb2bgw.supporttool.process.ISupportProcessor;
import com.orsb2bgw.supporttool.util.B2BLogger;
import com.orsb2bgw.supporttool.util.UtilityMethods;

@Service("sessionManagementProcessor")
@Qualifier("sessionManagement")
public class SessionManagementProcessor implements HttpSessionListener,ISupportProcessor{


	@Autowired
	AuditDao audit;
	
	private static B2BLogger logger=B2BLogger.getLogger(AuditDaoImpl.class);

	
	 private static int totalSessions;
	  
	  public static int getTotalActiveSession(){
		return totalSessions;
	  }
	  
	  @Override
	  public void sessionCreated(HttpSessionEvent event) {
	  
		  
		  //System.out.println("entering session created method   "+ audit);
		  //event.getSession().setAttribute("curSiteName", System.getProperty("SITE_NAME"));
	      //System.out.println("sessionCreated - add one session into counter");
		  
	  }

	  @Override
	  public void sessionDestroyed(HttpSessionEvent event) {
		  int resubmitCount=0;
		  int removeCount=0;
		  	  
		  //System.out.println(event.getSession().getAttribute("key")+">><<");
		  
		  //System.out.println("");
		  try {
			  HttpSession session=event.getSession();
			  String key=(String) session.getAttribute("key");
			  if(session.getAttribute("resubmitCount")!=null){
				  resubmitCount=(Integer) session.getAttribute("resubmitCount");
			  }
			  if(session.getAttribute("removeCount")!=null){
				  removeCount=(Integer) session.getAttribute("removeCount");
			  }
			  //System.out.println(audit +"<<<");
			  //new AuditDaoImpl().update(counter);	
			  //HttpSession session = event.getSession();

	          ApplicationContext ctx = 
	                WebApplicationContextUtils.
	                      getWebApplicationContext(session.getServletContext());

	          AuditDao audit = 
	                      (AuditDao) ctx.getBean("auditDao");

	          audit.update(key,resubmitCount,removeCount);
			  session.removeAttribute("sessionusername");
			  session.removeAttribute("key");
			  session.removeAttribute("curSiteName");
			  session.removeAttribute("resubmitCount");
			  session.removeAttribute("removeCount");

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.error("Exception", e);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("Exception", e);
		}
	  //System.out.println("sessionDestroyed - deduct one session from counter");
	  }

	    @Override
		public void process(SupportToolRequest supportToolRequest) {
			// TODO Auto-generated method stub
			int resubmitCount=0;
			int removeCount=0;
			HttpSession session=(HttpSession) supportToolRequest.getRequest();
			if(session.getAttribute("resubmitCount")!=null){
				  resubmitCount=(Integer) session.getAttribute("resubmitCount");
			  }
			  if(session.getAttribute("removeCount")!=null){
				  removeCount=(Integer) session.getAttribute("removeCount");
			  }
			Object siteObj=session.getAttribute("curSiteName");
			//System.out.println(siteObj);
			if(siteObj==null){
			session.setAttribute("curSiteName", System.getProperty("SITE_NAME"));
			}
			try {
				int updateResult=10;
				String curSite=(String) session.getAttribute("curSiteName");
				String siteId=UtilityMethods.getSiteNames().get(curSite);
				String sessionId=session.getId();
				UUID keyUuid = UUID.randomUUID();
				long ts=System.currentTimeMillis();
				String key=keyUuid.toString()+ts;
				//System.out.println(key);
				String userName=(String)session.getAttribute("sessionusername");
				if(session.getAttribute("key")!=null){
				updateResult=audit.update((String)session.getAttribute("key"),resubmitCount,removeCount);
				session.removeAttribute("resubmitCount");
				session.removeAttribute("removeCount");
				}
				session.setAttribute("key", key);
				int result=audit.insert(userName,key,sessionId,siteId);
				supportToolRequest.setResponse(result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.error("Exception", e);
			}
			
		}  
}



