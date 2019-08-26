package com.orsb2bgw.supporttool.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import com.orsb2bgw.supporttool.Objects.constants.ProcessorKeys;
import com.orsb2bgw.supporttool.Objects.dto.SupportToolRequest;
import com.orsb2bgw.supporttool.Objects.dto.UserDTO;
import com.orsb2bgw.supporttool.dao.RegisterDao;
import com.orsb2bgw.supporttool.process.ISupportProcessor;
import com.orsb2bgw.supporttool.util.B2BLogger;
import com.orsb2bgw.supporttool.util.HashCode;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {
	
	private static B2BLogger logger=B2BLogger.getLogger(AdminController.class);
	
	private static String errMessage="Exception";

	
	@Autowired
	RegisterDao registerDao;

	@Autowired
	HashCode hashCode;
	
	ISupportProcessor iSupportProcessor;
	
    @Autowired
    private WebApplicationContext context;
	
	private SupportToolRequest getContextObject(){
		return (SupportToolRequest) context.getBean("supportToolRequest");
	}
	
	@Resource(name="availableProcessors")
	private Map<String,ISupportProcessor> availableProcessors;
	
	String username;
	
	
	@RequestMapping("registration")
	public ModelAndView registrationForm(@RequestParam (required = false) String result,HttpServletRequest res) {
		String message="";
		String resultParam="";
		if(result!=null){
			resultParam=res.getParameter("result");
		int result1=Integer.parseInt(resultParam);
		if(result1!=-1 && result1!=-5)
			message=" User registered successfully";
		else if(result1==-1)
			message=" User already registered";
		else
			message="Registration failed. ";
		}
		return new ModelAndView("NewRegister", "message", message);
	}
	
	@RequestMapping("register")
	public void registerUser(HttpServletRequest req,HttpServletResponse res) {
		UserDTO user=new UserDTO();
		String uName=req.getParameter("username");
		String pwd=req.getParameter("password");
		String hashPassword = hashCode.getHashPassword(pwd);
		user.setPassword(hashPassword);
		user.setUsername(uName);
		user.setUserRole(req.getParameter("userRole"));
		int result=registerDao.registerUser(user);
		
		try {
			res.sendRedirect("registration?result="+result);
		} catch (IOException e) {
			logger.error(errMessage,e);
			
		}
		
		
	}
	

	@RequestMapping("index")
	public ModelAndView goToHomePage(@RequestParam (required = false) String logout) throws IOException {
		
		String msg="";
		if(logout!=null)
			msg="Logged Out successfully, login again to continue !";
		return new ModelAndView("index", "message", msg);
	}

	@RequestMapping("login")
	public ModelAndView getLoginForm(
			@RequestParam(required = false) String authfailed, String logout,
			String denied, HttpServletRequest req,HttpServletResponse res) {
		String message = "";
		if (authfailed != null) {
			message = "Invalid Username or Password, Please try with correct details !";
		} else if (logout != null) {
			req.getSession().invalidate();
			SecurityContextHolder.clearContext();
			message = "Logged Out successfully, login again to continue !";
			try {
				res.sendRedirect("index?logout");
			} catch (IOException e) {
				logger.error(errMessage,e);
			}
		} else if (denied != null) {
 			message = "Access denied for this user !";
		}
		return new ModelAndView("index", "message", message);
	}

	@RequestMapping("user")
	public String getUserPage(@ModelAttribute UserDTO user) {
		Collection<? extends GrantedAuthority> roles=null;
		
		username=null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (principal instanceof UserDetails) {
			username=((UserDetails)principal).getUsername();
			roles=((UserDetails)principal).getAuthorities();
			System.out.println(roles);
		} 
		if(roles!=null)
			return "redirect:nuser";
		
		else
			return "index";
	}



	
    @RequestMapping("nuser")
	public String getUserPage(HttpServletRequest request) {
    	SupportToolRequest supportToolRequest=null;
		supportToolRequest=getContextObject();
		HttpSession session = request.getSession();
		session.setAttribute("sessionusername", username);
		if(session.getAttribute("key")==null){
			iSupportProcessor=availableProcessors.get(ProcessorKeys.SESSIONMANAGEMENT_PROCESSOR.toString());
			supportToolRequest.setRequest(session);
			iSupportProcessor.process(supportToolRequest);
			
		}
		return "home";
	}


	@RequestMapping("403page")
	public String ge403denied() {
		return "redirect:login?denied";
	}
	

	
	

}
