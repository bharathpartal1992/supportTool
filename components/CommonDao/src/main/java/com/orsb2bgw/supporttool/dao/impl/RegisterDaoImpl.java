package com.orsb2bgw.supporttool.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.orsb2bgw.supporttool.Objects.dto.UserDTO;
import com.orsb2bgw.supporttool.dao.RegisterDao;
import com.orsb2bgw.supporttool.util.B2BLogger;

@Repository("registerDao")
public class RegisterDaoImpl implements RegisterDao {

	@Autowired
	DataSource dataSource;

	private static B2BLogger logger=B2BLogger.getLogger(RegisterDaoImpl.class);

	
	@Transactional
	public int registerUser(UserDTO user) {
		int success=10;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sqlToAddNewUser = "insert into orss_support_tool_users (user_name,pass_word,role) values (?,?,?)";
		String queryToGetExistingUser ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS WHERE UPPER(USER_NAME)='"+user.getUsername().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingUser=jdbcTemplate.queryForList(queryToGetExistingUser);
		if (existingUser!=null && !existingUser.isEmpty()){
		
			return -1;
		
		}else{
			try
			{
				success=jdbcTemplate
				.update(sqlToAddNewUser,
						new Object[] { user.getUsername(),
								user.getPassword(), user.getUserRole() });
				logger.info("User has been registered successfully in DB.");
			}
			catch(Exception e)
			{
				logger.error("Exception",e);
				success=-5;
			}
		return success;
		}

	
	}
	
	@Transactional
	public List<UserDTO> getAllUsers() {
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String queryToGetExistingUsers ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS";
		List<UserDTO> users=null;
		try
		{
		
	
			users=jdbcTemplate.query(queryToGetExistingUsers,new UserProfileRowMapper());
			logger.info("Users are successfully fetched from DB.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		return users;
		
	}
	private final class UserProfileRowMapper implements RowMapper<UserDTO>
	{

		public UserDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new UserDTO(rs.getString("USER_NAME"));
		}
		
	}
	@Transactional
	public int updateUserPassword(UserDTO user) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int success=0;
		String queryToUpdateExistingUserPassword="UPDATE ORSS_SUPPORT_TOOL_USERS set PASS_WORD=? where USER_NAME=?";
		String queryToGetExistingUser ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS WHERE UPPER(USER_NAME)='"+user.getUsername().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingUser=jdbcTemplate.queryForList(queryToGetExistingUser);
		if (existingUser !=null && !existingUser.isEmpty()){
		
			try
			{
			success=jdbcTemplate.update(queryToUpdateExistingUserPassword,
					new Object[] {user.getPassword(),user.getUsername()});
			logger.info("Password for user has been updated.");
			}
			catch(Exception e)
			{
				logger.error("Exception",e);
			}
			return success;
		
		}
		else
		{
		
			return -1;
		}
	}

	@Transactional
	public int deleteUser(UserDTO user) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int success=0;
		String queryToDeleteExistingUser="UPDATE ORSS_SUPPORT_TOOL_USERS set STATUS=1 where USER_NAME=?";
		String queryToGetExistingUser ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS WHERE UPPER(USER_NAME)='"+user.getUsername().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingUser=jdbcTemplate.queryForList(queryToGetExistingUser);
		if (existingUser !=null && !existingUser.isEmpty()){
		try
		{
			success=jdbcTemplate.update(queryToDeleteExistingUser,
					new Object[] {user.getUsername()});
			logger.info("User has been deleted successfully.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
			return success;
		
		}
		else
		{
			return -1;
			
		}
		
	
	}

}
