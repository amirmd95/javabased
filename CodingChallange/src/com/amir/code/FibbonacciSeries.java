package com.amir.code;

import java.util.Scanner;

public class FibbonacciSeries {

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter the number");
		int number=sc.nextInt();
		 long n1=0,n2=1,n3,i;
		 System.out.print(n1+" "+n2);
		 for(i=2;i<number;++i)
		 {
			 
			 n3=n1+n2;    
			  System.out.print(" "+n3);    
			  n1=n2;    
			  n2=n3; 
		 }
		
		

	}
	

	
	
	
		
		
		
		
	}

