package com.merrick.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.codec.binary.Base64;

public class Base64ToImage {

	public static void main(String[] args) {
		
		String srcimg = "D:\\0001_ICONS\\cat2.png";
		
		String b64enc = generateBase64fromPIC(srcimg);
		
		

//		String bstring = picstr;
		String asimgfile = "D://ex/testbase64toimgfile.png";
//		
		generateImg(b64enc,asimgfile);
		
		
		System.out.println("Done.");
		

	}
	
	private static String generateBase64fromPIC(String imagePath){
		String bstr = "";
		File f = new File(imagePath);
		
		if(!f.exists()){
			System.err.println("File not exist: "+imagePath);
			return null;
		}
		InputStream ins = null;
		try {
			ins = new FileInputStream(f);
			int l = ins.available();
			
			byte[] b = new byte[l];
			
			ins.read(b);
			
			bstr = Base64.encodeBase64String(b);
			
			
		}  catch (Exception e) {
			System.err.println(e.toString());
			
		} finally{
			if(ins!=null){
				try {
					ins.close();
				} catch (IOException e) {
					System.err.println(e.toString());
				}
			}
			
		}		
		System.out.println("ENC Done.: "+ bstr);
		return bstr;
	}
	
	
	
	private static void generateImg(String base64string, String imagePath){
		
		if(base64string == null || "".equals(base64string)){
			return ;
		}
		byte[] b = Base64.decodeBase64(base64string);
		
		for (int i = 0; i < b.length; i++) {
			if(b[i]<0){
				b[i] += 256;
			}
		}
		OutputStream ous = null;
		try {
			ous = new FileOutputStream(imagePath);
			ous.write(b);
			ous.flush();
			
		} catch (IOException e) {
			System.err.println(e.toString());
		} finally{
			if(ous!=null){
				try {
					ous.close();
				} catch (IOException e) {
					System.err.println(e.toString());
				}
			}
		}	
		
		System.out.println("DEC Done.:"+ imagePath);
	}
	
	public static String picstr = "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";

}
