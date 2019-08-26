package com.orsb2bgw.supporttool.dao;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import com.orsb2bgw.supporttool.dao.impl.AuditDaoImpl;


public class AuditDaoTest {

    private EmbeddedDatabase db;

    AuditDao userDao;
    
    @Autowired
    DataSource ds;
    
    @Before
    public void setUp() {
        //db = new EmbeddedDatabaseBuilder().addDefaultScripts().build();
    	db = new EmbeddedDatabaseBuilder()
    		.setType(EmbeddedDatabaseType.HSQL)
    		.addScript("create.sql")
    		.addScript("insert.sql")
    		.build();
    }

    @Test
    public void testFindByname() {
    	//NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(db);
    	AuditDaoImpl auditDao = new AuditDaoImpl();
    	
    	auditDao.setDataSource(ds);
    	String uName="testUser";
    	String key="testKey";
    	String sessionId="testSessionId";
    	String siteId="testSiteId";
    	Integer result=null;
		try {
			result = auditDao.insert(uName, key, sessionId, siteId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("test failure");
			e.printStackTrace();
		}
  
    	Assert.assertNotNull(result);
    	

    }

    @After
    public void tearDown() {
        db.shutdown();
    }

}