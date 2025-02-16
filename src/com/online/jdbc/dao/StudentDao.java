package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.online.jdbc.dto.ExamsDto;
import com.online.jdbc.dto.StudentDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class StudentDao {
	public static String studentLogin(String studid,String password)throws DBException{
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "SELECT studid,sname,password " +
					"FROM Student WHERE Studid=? AND password = ?";
			
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, studid);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				return rs.getString(2);
			else
				return null;
		} catch (Exception e) {
			System.out.println("StudentDao.studentLogin(): " + e);
			throw new DBException("Cant login at this time, try later!");
		}

	}	
	public static ArrayList<StudentDto> selectAllStudent()throws DBException{
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "SELECT studid,sname,password FROM Student";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ResultSet rs = ps.executeQuery();
			ArrayList<StudentDto> list = new ArrayList<StudentDto>();
			StudentDto student = null;
			
			while(rs.next()){
				student = new StudentDto();
				student.setStudid(rs.getString(1));
				student.setSname(rs.getString(2));
				student.setPassword(rs.getString(3));
				list.add(student);
			}
			return list;
		} catch (Exception e) {
			System.out.println("StudentDao.deletetStudent(): " + e);
			throw new DBException("Error: Unable to fetch the student details");
		}

	}

	
	public static boolean deleteStudent(String studid) throws DBException {
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "DELETE FROM Student WHERE studid = ?";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, studid);

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			System.out.println("StudentDao.deletetStudent(): " + e);
			throw new DBException("Error in removing a student data!");
		}
	}	
	public static boolean insertStudent(StudentDto student) throws DBException {
		boolean status=false;
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "INSERT INTO Student VALUES(?,?,?)";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, student.getStudid());
			ps.setString(2, student.getSname());
			ps.setString(3, student.getPassword());

			status =  (ps.executeUpdate() == 1);
		} catch (Exception e) {
			System.out.println("StudentDao.insertStudent(): " + e);
			throw new DBException("Failed to register new student");
		}
		return status;
	}
}
