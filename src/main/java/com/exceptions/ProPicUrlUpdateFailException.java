package com.exceptions;

public class ProPicUrlUpdateFailException extends Exception {

	private static final long serialVersionUID = 1L;

	public ProPicUrlUpdateFailException(String error) {
		super(error);
	}

}
