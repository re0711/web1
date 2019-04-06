package abc.common.utils;

import java.util.Calendar;

import org.apache.poi.ss.usermodel.DateUtil;
/** 
 * 自定义xssf日期工具类 
 * @author lp 
 * 
 */ 
public class XSSFDateUtil extends DateUtil{
	 
	 protected static int absoluteDay(Calendar cal, boolean use1904windowing) {    
	     return DateUtil.absoluteDay(cal, use1904windowing);    
     }   
	
}
