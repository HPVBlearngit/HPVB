package com.pvb.exception;

public class CustomException extends IllegalArgumentException{
	public CustomException(String msg) {
		super(msg);
	}
}
