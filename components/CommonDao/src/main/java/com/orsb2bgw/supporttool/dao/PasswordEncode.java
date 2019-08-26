package com.orsb2bgw.supporttool.dao;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncode {

	public static String getHashPassword(String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);

		//System.out.println(hashedPassword);
		return hashedPassword;
	}
	

}
