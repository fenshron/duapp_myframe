package cn.demo.util;

public class StringUtil {
	public static boolean isBlank(String str){
		if("".equals(str.trim())){
			return false;
		}else{
			return true;
		}
	}

}
