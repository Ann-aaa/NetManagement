package com.shop.util;

import java.util.Date;

public class GetRandom {

	public static Long getTime() {
		return System.currentTimeMillis();
	}

	public static int random() {
		return (int) ((Math.random() * 9 + 1) * 1000);
	}

	public static Long getNumber() {
		return Long.parseLong(String.valueOf(getTime()) + String.valueOf(random()));
	}

}
