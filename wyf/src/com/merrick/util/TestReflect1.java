package com.merrick.util;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;

import com.merrick.entity.Siteuser;

public class TestReflect1 {
	
	
	
	public static void testreflect(Object obj) throws Throwable{
		
		System.out.println("Class name: " + obj.getClass().getName());
		System.out.println("Class simple name: " + obj.getClass().getSimpleName());
		System.out.println("Package: " + obj.getClass().getPackage().getName());
		
		Package pkg = obj.getClass().getPackage();
		//obj.getClass().getConstructor(obj.getClass()).newInstance();
		
		
		Field[] fds = obj.getClass().getDeclaredFields();		
		
		Method[] mts = obj.getClass().getDeclaredMethods();
		
//		for (int i = 0; i < fds.length; i++) {
//			
//			String name = fds[i].getName();
//			System.out.println("=============");
//			System.out.println("field name: "+ name);
//			String type = fds[i].getGenericType().toString();
//			System.out.println("field type: "+ type);
//			
//			//fds[i].getType().getConstructor();
//					
//		}
//		
//		for (int i = 0; i < mts.length; i++) {
//			String name = mts[i].getName();
//			System.out.println("********************");
//			System.out.println("method name: "+ name);
//			String type = mts[i].getReturnType().toString();
//			System.out.println("method return type: "+ type);
//		}
		
		URL url = Thread.currentThread().getContextClassLoader().getResource(obj.getClass().getPackage().getName().replace(".", "/"));
		
		System.out.println(url);
		
		String type = url.getProtocol();
		
		System.out.println(type);
		
		
		System.out.println(url.getPath());
		
		File f = new File(url.getPath());
		File[] fs = f.listFiles();
		for (int i = 0; i < fs.length; i++) {
			if(fs[i].isFile()){
				System.out.println(fs[i].getName());
				System.out.println(fs[i].getPath());
			}
		}
		
		
	}
	
	

	public static void main(String[] args) throws Throwable {
		testreflect(new Siteuser() );

	}

}
