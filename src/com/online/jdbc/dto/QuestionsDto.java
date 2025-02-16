package com.online.jdbc.dto;

import java.io.Serializable;

public class QuestionsDto implements Serializable,Comparable{
	private int qid;
	private String examid;
	private String que;
	private String a,b,c,d,answer;
	private boolean attempt = false;
	private boolean correct = false;

	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getExamid() {
		return examid;
	}
	public void setExamid(String examid) {
		this.examid = examid;
	}
	public String getQue() {
		return que;
	}
	public void setQue(String que) {
		this.que = que;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public boolean isAttempt() {
		return attempt;
	}
	public void setAttempt(boolean attempt) {
		this.attempt = attempt;
	}
	public boolean isCorrect() {
		return correct;
	}
	public void setCorrect(boolean correct) {
		this.correct = correct;
	}
	public String toString(){
		return qid+","+examid+","+que+","+a+","+answer;
	}
	public int hashCode(){
		return qid;
	}
	public boolean equals(Object obj){
		return this.qid == ((QuestionsDto)obj).qid;
	}
	@Override
	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		return this.qid - ((QuestionsDto)o).qid;
	}
}









