package com.orsb2bgw.supporttool.Objects.dto;

import java.util.Arrays;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonView;
import com.orsb2bgw.supporttool.Objects.jsonview.Views;

@Component
public class WorkListKeys {
	
	@JsonView(Views.Public.class)
	private String[] keys;

	@Override
	public String toString() {
		return "WorkListKeys [keys=" + Arrays.toString(keys) + "]";
	}

	public String[] getKeys() {
		return keys;
	}

	public void setKeys(String[] keys) {
		this.keys = keys;
	}

	public WorkListKeys(String[] keys) {
		super();
		this.keys = keys;
	}
	public WorkListKeys() {
		
	}

	
}
