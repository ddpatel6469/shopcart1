package com.demo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.demo.model.Product;

public class ProductService {
	
	Connection con=null;
	public ProductService() {
		
		try {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feb2019","root","root");
	        }
		catch(Exception e) {
			System.out.println("hi baby");
			e.printStackTrace();
		}
	}

	public ArrayList<Product> viewAll(){
		
		ArrayList<Product> list = new ArrayList<Product>();
    	System.out.println("i am viewall");

		try {
				PreparedStatement ps = con.prepareStatement("select * from products");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					Product p = new Product(rs.getString(2),rs.getDouble(3),rs.getString(4));
					p.setId(rs.getInt(1));
					list.add(p);
				}
				
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
		
	}
	
	public int insert(String name,double price,String seller) {
		try {
			PreparedStatement ps = con.prepareStatement("insert into products(name,price,seller) values(?,?,?)");
			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setString(3, seller);
			return ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(String id1) {
		try {
			int v = Integer.parseInt(id1);
			PreparedStatement ps = con.prepareStatement("delete from products where id=?");
			ps.setInt(1,v);
			return ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public Product getRecordById(int id) {
		Product p=null;  
	    try{    
	        PreparedStatement ps=con.prepareStatement("select * from products where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            p=new Product();  
	            p.setId(rs.getInt("id"));  
	            p.setName(rs.getString("name"));  
	            p.setPrice(rs.getDouble("price"));  
	            p.setSeller(rs.getString("seller")); 
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return p;  
	}  
	
	public int update(String id,String name,Double price,String seller) {
		try {
			int a = Integer.parseInt(id);
			System.out.println("before update query");
			PreparedStatement ps = con.prepareStatement("update products set name=?,price=?,seller=? where id=?");
			System.out.println("after update query");
//			ps.setInt(0, v);
			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setString(3, seller);
			ps.setInt(4, a);
			System.out.println("before executeUpdate");
			ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}