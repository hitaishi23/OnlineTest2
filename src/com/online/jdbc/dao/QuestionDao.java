package com.online.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.online.jdbc.dto.ExamsDto;
import com.online.jdbc.dto.QuestionsDto;
import com.online.jdbc.dto.StudentDto;
import com.online.jdbc.exception.DBException;
import com.online.jdbc.util.DBUtil;

public class QuestionDao{
	public static ArrayList<QuestionsDto> selectAllQuestions(String examid)throws DBException{
		try {
			Connection con = DBUtil.connect();
			String sqlQuery = "SELECT * FROM Questions where examid=?";
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ps.setString(1, examid);
			
			ResultSet rs = ps.executeQuery();
			
			ArrayList<QuestionsDto> list = new ArrayList<QuestionsDto>();
			QuestionsDto q = null;
			
			while(rs.next()){
				q = new QuestionsDto();
				q.setQid(rs.getInt(1));
				q.setExamid(rs.getString(2));
				q.setQue(rs.getString(3));
				q.setA(rs.getString(4));
				q.setB(rs.getString(5));
				q.setC(rs.getString(6));
				q.setD(rs.getString(7));
				q.setAnswer(rs.getString(8));
				
				list.add(q);
			}
			return list;
		} catch (Exception e) {
			System.out.println("QuestionDao.selectAllQuestion(): " + e);
			throw new DBException("!");
		}

	}	
	public static boolean insertQuestion(QuestionsDto q) throws DBException {
	    boolean status = false;
	    try {
	        Connection con = DBUtil.connect();

	        // Debugging Output
	        System.out.println("Inserting Question:");
	        System.out.println("QID: " + q.getQid());
	        System.out.println("Exam ID: " + q.getExamid());
	        System.out.println("Question: " + q.getQue());
	        System.out.println("Option A: " + q.getA());
	        System.out.println("Option B: " + q.getB());
	        System.out.println("Option C: " + q.getC());
	        System.out.println("Option D: " + q.getD());
	        System.out.println("Answer: " + q.getAnswer());

	        // Check for NULL values before insertion
	        if (q.getQue() == null || q.getQue().trim().isEmpty()) {
	            throw new DBException("Error: Question text cannot be NULL or empty!");
	        }
	        if (q.getExamid() == null || q.getExamid().trim().isEmpty()) {
	            throw new DBException("Error: Exam ID cannot be NULL or empty!");
	        }

	        String sqlQuery = "INSERT INTO Questions VALUES(?,?,?,?,?,?,?,?)";
	        PreparedStatement ps = con.prepareStatement(sqlQuery);
	        ps.setInt(1, q.getQid()); 
	        ps.setString(2, q.getExamid());
	        ps.setString(3, q.getQue());
	        ps.setString(4, q.getA());
	        ps.setString(5, q.getB());
	        ps.setString(6, q.getC());
	        ps.setString(7, q.getD());
	        ps.setString(8, q.getAnswer());

	        status = (ps.executeUpdate() == 1);
	    } catch (Exception e) {
	        System.out.println("QuestionDao.insertQuestion(): " + e);
	        throw new DBException("Failed to insert new question: " + e.getMessage());
	    }
	    return status;
	}
}
