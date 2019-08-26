package com.orsb2bgw.supporttool.Objects.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;

@Component
public class ORSSMessageStatusDTO {
	
	@JsonView(Views.Public.class)
	Date y;
	@JsonView(Views.Public.class)
	int a; //success Count
	@JsonView(Views.Public.class)
	int b; //Failure Count
	@JsonView(Views.Public.class)
	int c; //Resubmitted Message Count
	@Override
	public String toString() {
		return "ORSSMessageStatusDTO [y=" + y + ", a=" + a + ", b=" + b + ", c=" + c + "]";
	}
	public ORSSMessageStatusDTO(Date y, int a, int b, int c) {
		super();
		this.y = y;
		this.a = a;
		this.b = b;
		this.c = c;
	}
	
	public ORSSMessageStatusDTO()
	{
		
	}
	public Date getY() {
		return y;
	}
	public void setY(Date y) {
		this.y = y;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public int getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}
	
	
	

}
