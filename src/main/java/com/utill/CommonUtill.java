package com.utill;

import java.io.IOException;
import java.util.Properties;

public class CommonUtill {
	public static final Properties properties = new Properties();

	static {
		try {
			// Read the property only once when load the class
			properties.load(CommonUtill.class.getResourceAsStream("config.properties"));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
