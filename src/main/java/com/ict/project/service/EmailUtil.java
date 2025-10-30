package com.ict.project.service;

import java.io.InputStream;
import java.util.Properties;

public class EmailUtil {
    private static final Properties PROPS = new Properties();
    
    static {
        try (InputStream is = EmailUtil.class.getClassLoader().getResourceAsStream("mail.properties")){
            PROPS.load(is);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static String get(String key) {
        return PROPS.getProperty(key);
    }
}