package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.online.jdbc.dto.ExamsDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class ExamsDao {
	public static boolean updateExams(ExamsDto exams) throws DBException {
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "UPDATE Exams SET topic=? WHERE examid = ?";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, exams.getTopic());
			ps.setString(2, exams.getExamid());

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			System.out.println("ExamsDao.updateExams(): " + e);
			throw new DBException("We cant update the test at this time!");
		}
	}

	public static ArrayList<ExamsDto> selectAllExams()throws DBException{
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "SELECT examid,topic FROM Exams";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ResultSet rs = ps.executeQuery();
			ArrayList<ExamsDto> list = new ArrayList<ExamsDto>();
			ExamsDto exams = null;
			
			while(rs.next()){
				exams = new ExamsDto();
				exams.setExamid(rs.getString(1));
				exams.setTopic(rs.getString(2));
				list.add(exams);
			}
			return list;
		} catch (Exception e) {
			System.out.println("ExamsDao.deletetExams(): " + e);
			throw new DBException("We cant remove the test at this time!");
		}

	}
	public static boolean deleteExams(String examid) throws DBException {
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "DELETE FROM Exams WHERE examid = ?";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, examid);

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			System.out.println("ExamsDao.deletetExams(): " + e);
			throw new DBException("We cant remove the test at this time!");
		}
	}

	public static boolean insertExams(ExamsDto exams) throws DBException {
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "INSERT INTO Exams VALUES(?,?)";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, exams.getExamid());
			ps.setString(2, exams.getTopic());

			return (ps.executeUpdate() == 1);
		} catch (Exception e) {
			System.out.println("ExamsDao.insertExams(): " + e);
			throw new DBException("New Exam Cant Create At This Time!");
		}
	}

}
