package com.orsb2bgw.supporttool.controller;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import com.orsb2bgw.supporttool.process.ISupportProcessor;
import com.orsb2bgw.supporttool.util.B2BLogger;
import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.constants.ProcessorKeys;
import com.orsb2bgw.supporttool.Objects.constants.ServiceMethods;
import com.orsb2bgw.supporttool.Objects.dto.AjaxResponseBody;
import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageDetailsDTO;
import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageStatusDTO;
import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.Objects.dto.SupplierDTO;
import com.orsb2bgw.supporttool.Objects.dto.SupportToolRequest;
import com.orsb2bgw.supporttool.Objects.dto.UserDTO;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;
import com.orsb2bgw.supporttool.Objects.dto.WorkListKeys;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;



@Controller
public class AdminController {
	
	ISupportProcessor iSupportProcessor;
	private static B2BLogger logger=B2BLogger.getLogger(AdminController.class);
	 
	
    @Autowired
    private WebApplicationContext context;
	
	private SupportToolRequest getContextObject(){
		return (SupportToolRequest) context.getBean("supportToolRequest");
	}
	
	
	@Resource(name="availableProcessors")
	private Map<String,ISupportProcessor> availableProcessors;
	
	
	

	@RequestMapping("/help")
	public ModelAndView helpPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("help");
		return model;
		
	} 
	
	@RequestMapping("/admin/addUser")
	public ModelAndView manageUserRegistration() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("addUser");
		return model;
		
	}
	
	
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="getResubmissionStatusData", method=RequestMethod.POST) 
	public AjaxResponseBody getPendingResubmissionCount(@RequestBody final SearchDTO searchCriteria,HttpServletRequest request) {
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		
		

		HttpSession session=request.getSession();

		searchCriteria.setSiteName((String)session.getAttribute("curSiteName"));
		
		
		supportToolRequest=getContextObject();
		
		supportToolRequest.setRequest(searchCriteria);

		supportToolRequest.setServiceMethod(ServiceMethods.GET_PENDINGRESUBMISSIONCOUNT);		
		iSupportProcessor=availableProcessors.get("user-SupportToolList"); 		
		iSupportProcessor.process(supportToolRequest);	
		
		
		int success=(int) supportToolRequest.getResponse();
		
		result.setReSubCount(success);
		
		
		supportToolRequest.setServiceMethod(ServiceMethods.GET_MESSAGERESUBMISSIONCOUNT);
		iSupportProcessor=availableProcessors.get("user-SupportToolList"); 		
		iSupportProcessor.process(supportToolRequest);	
		
		int successMessageCount=(int) supportToolRequest.getResponse();
		
		result.setMessageResubmittedCount(successMessageCount);
		
		return result;
		
		}
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="admin/userRegistration", method=RequestMethod.POST) 
	public AjaxResponseBody RegisterUser(@RequestBody final UserDTO user,HttpServletRequest request) {
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		
		HttpSession session=request.getSession();
		user.setSiteName((String)session.getAttribute("curSiteName"));

		
		supportToolRequest=getContextObject();
		supportToolRequest.setRequest(user);
		supportToolRequest.setServiceMethod(ServiceMethods.USER_REGISTRATION);
		
		iSupportProcessor=availableProcessors.get("user-Management"); 		
		iSupportProcessor.process(supportToolRequest);	
		
		
		int success=(int) supportToolRequest.getResponse();
		
		if(success==400)
		{
			result.setMsg("User Already Exist.");
			return result;
		}
		if(success>=0){
			result.setCode("200");
			result.setMsg("New User has been created Successfully.");
		
	
		}else{
			result.setCode("204");
			
			result.setMsg("User creation failed, Please try again.");
		}
		
		return result;
		
		}
	
	@RequestMapping("admin/supplierManagement")
	public ModelAndView manageSupplier(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("suppMgment");
		return model;
		
	}
	
	
	@RequestMapping("/home")
	public ModelAndView homePage() {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("home");
		return model;
		
	}

	
	@RequestMapping("/admin/home")
	public ModelAndView adminhomePage() {
		
		ModelAndView model = new ModelAndView();		
		model.setViewName("home");
		return model;
		
	}
	
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping("admin/getAllSuppliers")
	public AjaxResponseBody getAllSuppliers(HttpServletRequest request) {
		
		
		
		HttpSession session=request.getSession();		
		SearchDTO searchCriteria=new SearchDTO();		
		String siteName=session.getAttribute("curSiteName").toString();
		searchCriteria.setSiteName(siteName);
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		supportToolRequest=getContextObject();
		supportToolRequest.setServiceMethod(ServiceMethods.GET_SUPPLIERS);
		supportToolRequest.setRequest(searchCriteria);
		
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		List<SupplierDTO> suppliers=(List<SupplierDTO>) supportToolRequest.getResponse();
		
		result.setResult(suppliers);
		
		return result;
		
		
	}
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="admin/insertNewSupplier", method=RequestMethod.POST ,params = {"add"}) 
	public  AjaxResponseBody registerSupplier(@RequestBody final SupplierDTO supplier,HttpServletRequest request) {
		
		AjaxResponseBody result = new AjaxResponseBody();
		HttpSession session=request.getSession();
		SupportToolRequest supportToolRequest=null;
		
		supplier.setUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		supportToolRequest=getContextObject();
		String siteName=session.getAttribute("curSiteName").toString();
		supplier.setSiteName(siteName);
		
		supportToolRequest.setRequest(supplier);
		supportToolRequest.setServiceMethod(ServiceMethods.SUPPLIER_REGISTRATION);
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		
		iSupportProcessor.process(supportToolRequest);
		
		int success=(int) supportToolRequest.getResponse();
		
		

		SearchDTO searchCriteria=new SearchDTO();
	
		searchCriteria.setSiteName(siteName);
		
		supportToolRequest.setRequest(searchCriteria);


		
		supportToolRequest.setServiceMethod(ServiceMethods.GET_SUPPLIERS);
		
		iSupportProcessor.process(supportToolRequest);
		
		List<SupplierDTO> suppliers=(List<SupplierDTO>) supportToolRequest.getResponse();
		
		
		if(success==400)
		{
			result.setCode("204");
			result.setResult(suppliers);
			result.setMsg("Supplier Already Exist in Database");
			return result;
			
		}
		if(success>=0){
			result.setCode("200");
			result.setMsg("New Supplier has been created Successfully");
			result.setResult(suppliers);
	
		}else{
			result.setCode("204");
			result.setResult(suppliers);
			result.setMsg("Supplier Creation Failed, Please try again");
		}
		
		return result;
	}
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="admin/insertNewSupplier", method=RequestMethod.POST, params = {"remove"}) 
	public AjaxResponseBody deRegisterSupplier(@RequestBody final SupplierDTO supplier,HttpServletRequest request) {
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		HttpSession session=request.getSession();
		
		supplier.setUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		String siteName=session.getAttribute("curSiteName").toString();
		supplier.setSiteName(siteName);
	
		supportToolRequest=getContextObject();
		supportToolRequest.setRequest(supplier);
		supportToolRequest.setServiceMethod(ServiceMethods.SUPPLIER_DEREGISTRATION);
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		
		
		
		iSupportProcessor.process(supportToolRequest);
		
		int success=(int) supportToolRequest.getResponse();
		
		SearchDTO searchCriteria=new SearchDTO();
		
		searchCriteria.setSiteName(siteName);
		
		supportToolRequest.setRequest(searchCriteria);
		
		supportToolRequest.setServiceMethod(ServiceMethods.GET_SUPPLIERS);
		
		iSupportProcessor.process(supportToolRequest);
		
		List<SupplierDTO> suppliers=(List<SupplierDTO>) supportToolRequest.getResponse();
		
		if(success==400)
		{
			result.setCode("204");
			result.setResult(suppliers);
			result.setMsg("Supplier Does not Exist for Deletion");
			return result;
			
		}
		
		if(success>=0){
			result.setCode("200");
			result.setMsg("Supplier has been Removed");
			result.setResult(suppliers);
	
		}else{
			result.setCode("204");
			result.setResult(suppliers);
			result.setMsg("Supplier is not removed, please try after some time");
		}
		

		return result;
		
		
	}
	
	@RequestMapping("/admin/passwordManagement")
	public ModelAndView manageUserPassword(HttpServletRequest request) {
		SupportToolRequest supportToolRequest=null;
		ModelAndView model = new ModelAndView();
		
		
		HttpSession session=request.getSession();
		UserDTO user=new UserDTO();
		String siteName=session.getAttribute("curSiteName").toString();
		user.setSiteName(siteName);
		
		supportToolRequest=getContextObject();
		supportToolRequest.setRequest(user);
		supportToolRequest.setServiceMethod(ServiceMethods.FETCH_USERS);
		
		
		
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		
		List<UserDTO> users=(List<UserDTO>) supportToolRequest.getResponse();
	
		model.addObject("userList",users);
		model.setViewName("pwdMgment");
		return model;
		
	}
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="admin/updateUserPassword", method=RequestMethod.POST) 
	public AjaxResponseBody updateUserPassword(@RequestBody final UserDTO user,HttpServletRequest request) {
		
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		
		HttpSession session=request.getSession();
		user.setSiteName((String)session.getAttribute("curSiteName"));
		
		supportToolRequest=getContextObject();
	
		supportToolRequest.setRequest(user);
		supportToolRequest.setServiceMethod(ServiceMethods.USER_PWD_UPDATION);
		

		
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		
		
		int success=(int)supportToolRequest.getResponse();
		
		supportToolRequest.setServiceMethod(ServiceMethods.FETCH_USERS);
		
		iSupportProcessor.process(supportToolRequest);
		
		List<UserDTO> users=(List<UserDTO>) supportToolRequest.getResponse();
		
		if(success>=0){
			result.setCode("200");
			result.setMsg("Password has been Updated Successfully.");
		
	
		}else{
			result.setCode("204");
			
			result.setMsg("Password Update Failure, Please try again.");
		}
		

		return result;
		
		
		
		
		
		
		
	}
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="admin/userAjaxList", method=RequestMethod.POST) 
	public AjaxResponseBody enableUserAccess(@RequestBody final SupplierDTO supplier,HttpServletRequest request) {
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		supportToolRequest=getContextObject();
		
		
		HttpSession session=request.getSession();
		UserDTO user=new UserDTO();
		user.setSiteName((String)session.getAttribute("curSiteName"));
		
	
		
		supportToolRequest.setRequest(user);
		
		iSupportProcessor=availableProcessors.get("user-Management"); 
		supportToolRequest.setServiceMethod(ServiceMethods.FETCH_USERS);
		
		iSupportProcessor.process(supportToolRequest);
		
		List<UserDTO> users=(List<UserDTO>) supportToolRequest.getResponse();
		
		
		
			result.setUsers(users);
		

		return result;
		
		
		
	}
	
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="admin/userAccessManagement", method=RequestMethod.POST,params = {"enable"}) 
	public AjaxResponseBody enableUserAccess(@RequestBody final UserDTO user,HttpServletRequest request) {
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		supportToolRequest=getContextObject();		
		HttpSession session=request.getSession();
		user.setSiteName((String)session.getAttribute("curSiteName"));	
		supportToolRequest.setRequest(user);
		supportToolRequest.setServiceMethod(ServiceMethods.ENABLE_USER_ACCESS);		
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		
		
		int success=(int)supportToolRequest.getResponse();
		
		supportToolRequest.setServiceMethod(ServiceMethods.FETCH_USERS);
		
		iSupportProcessor.process(supportToolRequest);
		
		List<UserDTO> users=(List<UserDTO>) supportToolRequest.getResponse();
		
		
		if(success>=0){
			result.setUsers(users);
			result.setCode("200");
			result.setMsg("User Access has been Activated.");
		
	
		}else{
			result.setCode("204");
			
			result.setMsg("User Access Activation Failed, Please try Later");
		}
		

		return result;
		
		
		
	}
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="/admin/setSiteName", method=RequestMethod.POST) 
	public AjaxResponseBody setSiteInSessionAdmin(@RequestBody final SearchDTO searchCriteria,HttpServletRequest request) {
	 
		AjaxResponseBody result = new AjaxResponseBody();

		HttpSession session=request.getSession();
	String siteName=searchCriteria.getSiteName();
	
	if(siteName==null || siteName.isEmpty() )
	{
		String site=System.getProperty("SITE_NAME");
		session.setAttribute("curSiteName", site);

	}
	else
	{
		session.setAttribute("curSiteName", siteName);
	}
	
	return result;
	
	}
	
	
	
	
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="setSiteName", method=RequestMethod.POST) 
	public AjaxResponseBody setSiteInSession(@RequestBody final SearchDTO searchCriteria,HttpServletRequest request) {
	 
		String message="";
		SupportToolRequest supprequest=getContextObject();
		AjaxResponseBody result = new AjaxResponseBody();

		HttpSession session=request.getSession();
	String siteName=searchCriteria.getSiteName();
	
	if(siteName==null || siteName.isEmpty() )
	{
		String site=System.getProperty("SITE_NAME");
		session.setAttribute("curSiteName", site);

	}
	else
	{
		
		supprequest.setRequest(siteName.trim());
		supprequest.setServiceMethod(ServiceMethods.GET_SITE_STATUS);
		
		String existingSite=(String)session.getAttribute("curSiteName");
		if(!existingSite.equals(siteName)){
	    iSupportProcessor=availableProcessors.get("user-Management"); 
		iSupportProcessor.process(supprequest);
		String status=(String)supprequest.getResponse();
		if(!status.equalsIgnoreCase("Inservice")){
			if(status.equalsIgnoreCase("Outofservice")){
				message="Site is down for maintainance. Please try after some time.";
			}else
				
			message=status;
		}
		else{
			session.setAttribute("curSiteName", siteName);
			iSupportProcessor=availableProcessors.get("session_management");
			supprequest.setRequest(session);
			iSupportProcessor.process(supprequest);
			
		}
		}
		
		result.setMsg(message);
		
	}
	
	return result;
	
	}
		
	
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="admin/userAccessManagement", method=RequestMethod.POST,params = {"disable"}) 
	public AjaxResponseBody disableUserAccess(@RequestBody final UserDTO user,HttpServletRequest request) {
		SupportToolRequest supportToolRequest=null;
		AjaxResponseBody result = new AjaxResponseBody();
		supportToolRequest=getContextObject();
		
		HttpSession session=request.getSession();
		user.setSiteName((String)session.getAttribute("curSiteName"));
	
		
		supportToolRequest.setRequest(user);
		supportToolRequest.setServiceMethod(ServiceMethods.DISABLE_USER_ACCESS);		
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		
		
		int success=(int)supportToolRequest.getResponse();
		
		supportToolRequest.setServiceMethod(ServiceMethods.FETCH_USERS);
		
		iSupportProcessor.process(supportToolRequest);
		
		List<UserDTO> users=(List<UserDTO>) supportToolRequest.getResponse();

		

		if(success>=0){
			result.setCode("200");
			result.setUsers(users);
			result.setMsg("User Access has been DeActivated.");
		
	
		}else{
			result.setCode("204");
			
			result.setMsg("User Access Activation Failed, Please try Later");
		}
		
		return result;
		
	}
	
	@RequestMapping("/supportTool")
	public ModelAndView manageSupportTool(HttpServletRequest request) {
		
		SupportToolRequest supportToolRequest=null;
		HttpSession session=request.getSession();
		
		
		SearchDTO searchCriteria=new SearchDTO();
		
		String siteName="";
		if(session.getAttribute("curSiteName")!=null)
			siteName=session.getAttribute("curSiteName").toString();
		else
			siteName=System.getProperty("SITE_NAME");
		searchCriteria.setSiteName(siteName);

		supportToolRequest=getContextObject();

		supportToolRequest.setRequest(searchCriteria);
		
		ModelAndView model = new ModelAndView();
		
		supportToolRequest.setServiceMethod(ServiceMethods.GET_SUPPLIERS);
		
		
		iSupportProcessor=availableProcessors.get("user-Management"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		List<SupplierDTO> suppliers=(List<SupplierDTO>) supportToolRequest.getResponse();
		
		supportToolRequest.setServiceMethod(ServiceMethods.MESSAGE_CODES);
		
		iSupportProcessor=availableProcessors.get("user-SupportToolList");
		
		iSupportProcessor.process(supportToolRequest);
		
		List<String> messageCodes=(List<String>)supportToolRequest.getResponse();
		
		model.addObject("supplierList",suppliers);
		model.addObject("messageCodes",messageCodes);

		model.setViewName("supportTool");
		
		
		return model;
		
	}
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping("searchSupportTool")
	public AjaxResponseBody searchSupportTool(@RequestBody final SearchDTO searchCriteria,HttpServletRequest request) {
		
		
		SupportToolRequest supportToolRequest=null;
		HttpSession session=request.getSession();

		searchCriteria.setSiteName((String)session.getAttribute("curSiteName"));
		AjaxResponseBody result = new AjaxResponseBody();
		supportToolRequest=getContextObject();
		
		supportToolRequest.setRequest(searchCriteria);
		supportToolRequest.setServiceMethod(ServiceMethods.SUPPORT_TOOL_SEARCH);
		

		
		iSupportProcessor=availableProcessors.get("user-SupportToolList"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		List<ORSSMessageDetailsDTO> orssMessageDetailsSearchResult=(List<ORSSMessageDetailsDTO>) supportToolRequest.getResponse();
		int noOfRecord=supportToolRequest.getRecordCount();
		
		
		

	
			result.setSearchResultCount(noOfRecord);
			result.setMessageDetails(orssMessageDetailsSearchResult);
			result.setSearchCriteria(searchCriteria);
			
	
		
		return result;
		
		
	}
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="getWeeklyStatus", method=RequestMethod.POST)
	public AjaxResponseBody getWeeklyMessageStatus(@RequestBody final SearchDTO searchCriteria,HttpServletRequest request) {
		
		SupportToolRequest supportToolRequest=null;
		HttpSession session=request.getSession();

		searchCriteria.setSiteName((String)session.getAttribute("curSiteName"));
		
		
		AjaxResponseBody result = new AjaxResponseBody();
		supportToolRequest=getContextObject();
		
		supportToolRequest.setRequest(searchCriteria);
	
		supportToolRequest.setServiceMethod(ServiceMethods.GET_WEEKLY_STATUS);
		

		
		iSupportProcessor=availableProcessors.get("user-SupportToolList"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		List<ORSSMessageStatusDTO> orssMessageStatusResults=(List<ORSSMessageStatusDTO>) supportToolRequest.getResponse();
		
		
		result.setStatusDetails(orssMessageStatusResults);
	
		return result;
		
		
	}
	
	
	
	
	
	@RequestMapping(value="downloadCSV", method=RequestMethod.POST)
	public void downloadCSV(HttpServletRequest request,HttpServletResponse response,@ModelAttribute SearchDTO searchCriteria) throws IOException {

		SupportToolRequest supportToolRequest=null;
		supportToolRequest=getContextObject();
		supportToolRequest.setRequest(searchCriteria);		
		supportToolRequest.setServiceMethod(ServiceMethods.SUPPORT_TOOL_SEARCH);
				
		
		iSupportProcessor=availableProcessors.get("user-SupportToolList"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		
		List<ORSSMessageDetailsDTO> SearchResult=(List<ORSSMessageDetailsDTO>) supportToolRequest.getResponse();
		response.setContentType("text/csv");
		String reportName = "Search_Results.csv";
		response.setHeader("Content-disposition", "attachment;filename="+reportName);

		ArrayList<String> rows = new ArrayList<String>();
		rows.add("SenderMsgID,ReceiverMsgID,Estimate No,Supplier,Contract No,Timestamp,MessageCode,Business Status,Nims Slip Number,Supplier Ref");
		
		
		
		rows.add("\n");
		
		
		for(ORSSMessageDetailsDTO orssMessageDetailRecord: SearchResult)
		{
			rows.add(orssMessageDetailRecord.getSenderMessageId()+","+
					orssMessageDetailRecord.getReceiverMessageId()+","+
					orssMessageDetailRecord.getEstimateNumber()+","+
					orssMessageDetailRecord.getSupplierId()+","+
					orssMessageDetailRecord.getContractNumber()+","+
					orssMessageDetailRecord.getMessageTimeStamp()+","+
					orssMessageDetailRecord.getMessageCode()+","+
					orssMessageDetailRecord.getStatus()+","+
					orssMessageDetailRecord.getNimsSlipNumber()+","+
					orssMessageDetailRecord.getSupplierRefNumber()
					);
			rows.add("\n");
		}

		Iterator<String> iter = rows.iterator();
		while (iter.hasNext()) {
			String outputString = (String) iter.next();
			response.getOutputStream().print(outputString);
		}

		response.getOutputStream().flush();

	}
	
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="getDetail",params = {"payload"})
	public AjaxResponseBody getMessagePayload(@RequestBody final ORSSMessageDetailsDTO message,HttpServletRequest request) throws SQLException {
		SupportToolRequest supportToolRequest=null;
		
		HttpSession session=request.getSession();

		message.setSiteName((String)session.getAttribute("curSiteName"));
		
		
		supportToolRequest=getContextObject();
		AjaxResponseBody result = new AjaxResponseBody();
		
		
		supportToolRequest.setRequest(message);
		supportToolRequest.setServiceMethod(ServiceMethods.SUPPORT_TOOL_MESSAGE_SEARCH);
		

		
		iSupportProcessor=availableProcessors.get("user-SupportToolList"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		ORSSMessageDetailsDTO orssMessageDetail=(ORSSMessageDetailsDTO) supportToolRequest.getResponse();
		
	
			
			
			char clobVal[] = new char[(int) orssMessageDetail.getPayload().length()];
		    Reader r = orssMessageDetail.getPayload().getCharacterStream();
		    try {
				r.read(clobVal);
			} catch (IOException e) {
				logger.error("error",e);
				
			}

		result.setClobVal(clobVal);
	
		
		return result;
		
		
	}
	
	
	@JsonView(Views.Public.class)
	@ResponseBody
	@RequestMapping(value="getDetail",params = {"status"})
	public AjaxResponseBody getMessageStatus(@RequestBody final ORSSMessageDetailsDTO message,HttpServletRequest request) throws SQLException {
		

		SupportToolRequest supportToolRequest=null;
		HttpSession session=request.getSession();

		message.setSiteName((String)session.getAttribute("curSiteName"));
		
		
		supportToolRequest=getContextObject();
		AjaxResponseBody result = new AjaxResponseBody();
		
		
		supportToolRequest.setRequest(message);
		supportToolRequest.setServiceMethod(ServiceMethods.GET_MESSAGE_STATUS);
		

		
		iSupportProcessor=availableProcessors.get("user-SupportToolList"); 
		
		iSupportProcessor.process(supportToolRequest);
		
		ORSSMessageDetailsDTO orssMessageDetail=(ORSSMessageDetailsDTO) supportToolRequest.getResponse();
		
	
			
			
			
			

		result.setSinglemessageDetail(orssMessageDetail);
		
		

		
		
	
		
		return result;
		
		
	}
	
	@RequestMapping(value="workList",method=RequestMethod.GET)
	public ModelAndView getAllWorkList() {
		ModelAndView model = new ModelAndView();
		model.setViewName("workList");
		return model;
		
	}
		
	    @JsonView(Views.Public.class)
	    @ResponseBody
		@RequestMapping("getWorkList")
	    public AjaxResponseBody getWorkList(@ModelAttribute WorkListDTO worklist,HttpServletRequest request) {   	
	    AjaxResponseBody result = new AjaxResponseBody();
	    
	    
	    SupportToolRequest supportToolRequest=null;
		supportToolRequest =getContextObject();
		ISupportProcessor isp=availableProcessors.get(ProcessorKeys.WORKLIST_PROCESSOR.toString());
		Object[] obj=new Object[2];
		obj[0]=worklist;obj[1]=request;
		supportToolRequest.setRequest(obj);
		supportToolRequest.setCurrentSiteName((String)request.getSession().getAttribute("curSiteName"));
		supportToolRequest.setServiceMethod(ServiceMethods.GET_WORKLIST);
		isp.process(supportToolRequest);
		List<WorkListDTO> resObj=null;
		if(supportToolRequest.getResponse()!=null){
			List<WorkListDTO> lst=(List<WorkListDTO>)supportToolRequest.getResponse();
			result.setResultWorklist(lst);
			
			
	    }else{
	    	result.setCode("DBERROR");
	    	result.setMsg("Site is Down. Choose Other site");
	    }
	    			
		return result;
	}
	@JsonView(Views.Public.class)	
	
	
	@ResponseBody
	@RequestMapping(value="worklist", method=RequestMethod.POST,params = {"Resubmit"})
	public AjaxResponseBody resubmitWorkList(@RequestBody final WorkListKeys keys,HttpServletRequest request){
		
		    SupportToolRequest supportToolRequest=null;
		    AjaxResponseBody result = new AjaxResponseBody();
		    supportToolRequest=getContextObject();
			ISupportProcessor isp=availableProcessors.get(ProcessorKeys.WORKLIST_PROCESSOR.toString());
			String[] KeysFromAjax = keys.getKeys();
			supportToolRequest.setRequest(KeysFromAjax);
			supportToolRequest.setServiceMethod(ServiceMethods.RESUBMIT_DETAILS);
			supportToolRequest.setCurrentSiteName((String)request.getSession().getAttribute("curSiteName"));
			isp.process(supportToolRequest);
			Object[] resObj=(Object[]) supportToolRequest.getResponse();
		    //System.out.println(resObj);
		    int resultCount=(Integer) resObj[0];
		    int sessionCount=0;
		    if(request.getSession().getAttribute("resubmitCount")!=null){
		    	sessionCount=(Integer)request.getSession().getAttribute("resubmitCount");
		    	sessionCount=sessionCount+resultCount;
		    }
		    else
		    	sessionCount=resultCount;
		    request.getSession().setAttribute("resubmitCount", sessionCount);
		    List<WorkListDTO> worklist=(List<WorkListDTO>) resObj[1];
		    String resultMessage="";
		    if(resultCount!=5){
		    	resultMessage= resultCount + " Messages out of " + KeysFromAjax.length + " has been resubmitted";
		    	result.setMsg(resultMessage);
			    result.setResultWorklist(worklist);		
		    }
		    else{
		    	resultMessage="Current site is Down.";
		    	result.setMsg(resultMessage);
			    result.setCode("DBERROR");;		
		    }
		    	
		    return result;
		}	
	

	
	@JsonView(Views.Public.class)	
	@ResponseBody
	@RequestMapping(value="worklist", method=RequestMethod.POST,params = {"Remove"})
	public AjaxResponseBody removeWorkList(@RequestBody final WorkListKeys keys,HttpServletRequest request){
		
		    SupportToolRequest supportToolRequest=null;
		    AjaxResponseBody result = new AjaxResponseBody();
		    supportToolRequest=getContextObject();
			ISupportProcessor isp=availableProcessors.get(ProcessorKeys.WORKLIST_PROCESSOR.toString());
			String[] KeysFromAjax = keys.getKeys();
			supportToolRequest.setRequest(KeysFromAjax);
			supportToolRequest.setServiceMethod(ServiceMethods.REMOVE_DETAILS);
			supportToolRequest.setCurrentSiteName((String)request.getSession().getAttribute("curSiteName"));
			isp.process(supportToolRequest);
			Object[] resObj=(Object[]) supportToolRequest.getResponse();
		    int resultCount=(Integer) resObj[0];
		    int sessionCount=0;
		    if(request.getSession().getAttribute("removeCount")!=null){
		    	sessionCount=(Integer)request.getSession().getAttribute("removeCount");
		    	sessionCount=sessionCount+resultCount;
		    }
		    else
		    	sessionCount=resultCount;
		    request.getSession().setAttribute("removeCount", sessionCount);
		    List<WorkListDTO> worklist=(List<WorkListDTO>) resObj[1];
		    String resultMessage="";
		    if(resultCount!=-5){
		    	resultMessage= resultCount + " Messages out of " + KeysFromAjax.length + " has been removed";
		        result.setMsg(resultMessage);
		        result.setResultWorklist(worklist);	
		    }
		    else{
		    	resultMessage="Current Site is Down.";
		    	result.setMsg(resultMessage);
			    result.setCode("DBERROR");;
		    }
			
		    return result;
		}
	


}
