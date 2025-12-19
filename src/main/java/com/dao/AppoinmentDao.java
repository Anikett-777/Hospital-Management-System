package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Appointment;

public class AppoinmentDao {
	private Connection conn;

	public AppoinmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppoinment(Appointment ap) {
		boolean f=false;
		try {
			String sql="insert into appointment(user_id, fullName, gender, age, appoinDate, email, phNo, diseases, doctorId, address, status)values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppoinDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhNo());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}
}
