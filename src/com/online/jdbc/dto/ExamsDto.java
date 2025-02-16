package com.online.jdbc.dto;

import java.io.Serializable;

public class ExamsDto implements Serializable{
	private String examid;
	private String topic;
	
	public String getExamid() {
		return examid;
	}
	public void setExamid(String examid) {
		this.examid = examid;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	
}
