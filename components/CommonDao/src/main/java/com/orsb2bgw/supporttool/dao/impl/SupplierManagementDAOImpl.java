package com.orsb2bgw.supporttool.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.Objects.dto.SupplierDTO;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;

import com.orsb2bgw.supporttool.dao.SupplierManagementDAO;
import com.orsb2bgw.supporttool.util.B2BLogger;

@Repository("supplierManagementDAO")
public class SupplierManagementDAOImpl implements SupplierManagementDAO{

	@Autowired
	DataSource dataSource;
	
	/*@Autowired
	DataSource dataSource1;*/
	
	 @Autowired
	 private ApplicationContext context;

	 private DataSource getDataSource(){
				DataSource dataSource1=null;
				try{
				if(context.getBean("dataSource1")!=null)
					dataSource1=(DataSource) context.getBean("dataSource1");
				//return dataSource1;
				}catch(Exception e){
					logger.error("Exception",e);
					
					
				}
				return dataSource1;
				
			}

	private JdbcTemplate getJdbcTemplate(String siteName){
			JdbcTemplate jdbcTemplate=null;
			if(siteName.equalsIgnoreCase("site1"))
			{
				 jdbcTemplate = new JdbcTemplate(dataSource);
			}
			if(siteName.equalsIgnoreCase("site2"))
			{
				DataSource ds=getDataSource();
				if(ds!=null)
				 jdbcTemplate = new JdbcTemplate(ds);
				else
					jdbcTemplate=null;
				 //System.out.println(ds);
				 //System.out.println(jdbcTemplate);
			}
			return jdbcTemplate;
		}
	
	
	private static B2BLogger logger=B2BLogger.getLogger(SupplierManagementDAOImpl.class);
	
	@Override
	@Transactional
	public int registerSupplier(SupplierDTO supplier) {

		
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(supplier.getSiteName());
		String sqlToAddNewSupplier = "insert into orss_supplierid (SUPPLIER_ID,USER_ORSS,INSERTEDTIME) values (?,?,?)";
		String queryToGetExistingSupplier ="SELECT SUPPLIER_ID FROM orss_supplierid WHERE UPPER(SUPPLIER_ID)='"+supplier.getSupplierId().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingSupplier=jdbcTemplate.queryForList(queryToGetExistingSupplier);
		if (existingSupplier!=null && !existingSupplier.isEmpty()){
		
			return 400;
		
		}else{
			
		Date date=new Date();
		Timestamp timestamp=new Timestamp(date.getTime());
		int success=0;
		try
		{
		success=jdbcTemplate
				.update(sqlToAddNewSupplier,
						new Object[] {supplier.getSupplierId(),supplier.getUserName(),timestamp});
		
		logger.info("Insert for Supplier has succefully executed");
		
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		
		return success;
		
		}

	}

	@Override
	@Transactional
	public List<SupplierDTO> getAllSuppliers(SearchDTO searchCriteria) {
		
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(searchCriteria.getSiteName());
		
		String queryToGetExistingSuppliers ="SELECT SUPPLIER_ID FROM orss_supplierid order by SUPPLIER_ID";
		List<SupplierDTO> suppliers=null;
		try
		{
			suppliers=jdbcTemplate.query(queryToGetExistingSuppliers,new SupplierProfileRowMapper());
			logger.info("Suppliers are successfully fetched from DB.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		return suppliers;
		}
	
	private final class SupplierProfileRowMapper implements RowMapper<SupplierDTO>
	{

		public SupplierDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new SupplierDTO(rs.getString("SUPPLIER_ID"));
		}
		
	}

	@Override
	@Transactional
	public int deRegisterSupplier(SupplierDTO supplier) {
		
		int success=0;
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(supplier.getSiteName());
		
		String sqlToAddRemoveSupplier= "delete from orss_supplierid where UPPER(SUPPLIER_ID)=?";
		String queryToGetExistingSupplier ="SELECT SUPPLIER_ID FROM orss_supplierid WHERE UPPER(SUPPLIER_ID)='"+supplier.getSupplierId().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingSupplier=jdbcTemplate.queryForList(queryToGetExistingSupplier);
		if (existingSupplier==null || existingSupplier.isEmpty()){
		
			return 400;
		
		}
		else
		{
			
			try
			{	
		 success=jdbcTemplate.update(sqlToAddRemoveSupplier,new Object[] {supplier.getSupplierId()});
		 logger.info("Supplier has been successfully degistered from DB.");
			}
			catch(Exception e)
			{
				logger.error("Exception",e);
			}
			return success;
	}

	}
	}
