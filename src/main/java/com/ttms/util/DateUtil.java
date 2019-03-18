package com.ttms.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {
	
	
	public  static Date  getEndTime(Date startTime,int filmLong)
	{
		Calendar calendar   =   new   GregorianCalendar(); 
		calendar.setTime(startTime);
		calendar.add(Calendar.MINUTE, filmLong);
		Date endtTime = calendar.getTime();
		return endtTime;
	}

}
