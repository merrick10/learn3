package com.merrick.annotest;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AnnoDeal1 {
	
	
	public static void deal_personal1(List<Integer> cases, Class<?> clz){
		
		for(Method m: clz.getDeclaredMethods()){
			
			System.out.println("===========================");
			personal1 p1 = m.getAnnotation(personal1.class);
			
			if(p1!=null){
				System.out.println("Found: "+ p1.id() + ", " + p1.p1());
				
				cases.remove(new Integer(p1.id()));
			}
			
			for (Integer i : cases) {
				System.out.println("Missing: person1: " + i);
			}
			System.out.println("list length: " + cases.size());
		}
	}
	
	public static void main(String[] args){

		List<Integer> cases = new ArrayList<Integer>();
		Collections.addAll(cases, 1,2,3,4);
		deal_personal1(cases,AnnoTest1.class);
		
	}

}
