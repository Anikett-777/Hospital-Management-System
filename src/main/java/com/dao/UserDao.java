package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
	
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean Register(User u) {
		boolean f=false;
		
		try {
			String sql = "insert into user_details(fullName,email,password)values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
		   int i = 	ps.executeUpdate();
		   if(i==1) {
			   f=true;
			   System.out.println("User Register Succesfully");
		   }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public User login(String em,String ps) {
		User u = null;
		try {
			String sql = "select * from user_details where email=? and password=?";
			PreparedStatement p =conn.prepareStatement(sql);
			p.setString(1, em);
			p.setString(2, ps);
			
			ResultSet rs= p.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return u;
	}

}



