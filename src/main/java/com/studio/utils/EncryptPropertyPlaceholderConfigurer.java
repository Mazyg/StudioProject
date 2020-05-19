package com.studio.utils;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class EncryptPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {


    private String[] encryptPropNames = {"jdbc.username","jdbc.password"};
    
    protected String convertProperty(String propertyName,String propertyValue){
        if(isEncryptProp(propertyName)){
            //解密
            String decryptValue = DESUtil.getDecryptString(propertyValue);
            return decryptValue;
        }else{
            //如未加密，则返回原本的值
            return propertyValue;
        }
    }


    private boolean isEncryptProp(String propertyName) {
            //若等于需要解密的字段，则进行解密
               for (String encryptPropName : encryptPropNames){
            	            if (encryptPropName.equals(propertyName)){
                	                return true;
                            }
                    }
        	        return false;
        	    }
	}


