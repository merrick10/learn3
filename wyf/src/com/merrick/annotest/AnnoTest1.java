package com.merrick.annotest;



public class AnnoTest1 {

	@personal1(id = 1, p1="First")
	public void f1(){
		
		System.out.println("f1");
	}
	
	@personal1(id = 2, p1="second")
	public void f2(){
		System.out.println("f2");
		
	}
	
	@personal1(id = 3)
	public void f3(){
		System.out.println("f3");
		
	}
	
	public void f4(){
		System.out.println("f4");
		
	}
}
