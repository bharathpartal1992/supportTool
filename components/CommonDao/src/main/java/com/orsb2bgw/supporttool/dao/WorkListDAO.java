package com.orsb2bgw.supporttool.dao;

import java.util.List;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;

public interface WorkListDAO  {
       public List<WorkListDTO> searchWorkList();
       
       public int removeDetails(String[] remove,String currSiteName) throws Exception;
       //public int getWorklistdetailscount(String view,WorkListDTO worklist,String currSiteName) throws Exception;
       public List getWorklistdetails(String view,WorkListDTO worklist,String currSiteName ) throws Exception;
       public int resubmitDetails(String[] resubmit,String currSiteName) throws Exception;
       
}
