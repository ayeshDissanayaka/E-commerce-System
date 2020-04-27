package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Product;



public class ProductDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int add(Product product, int suppID) {
		
		String img = "/resources/images/products/" + product.getProdImage();
		
		String sql = "insert into product (suppID, name, unitPrice, brand, description, catID, prodImage, addedDate) values ('"+suppID+"',"
				+ "'"+product.getName()+"', '"+product.getUnitPrice()+"', '"+product.getBrand()+"', '"+product.getDescription()+"', '"+product.getCatID()+"',"
						+ "'"+img+"', NOW())";
		return template.update(sql);

	}

	public int edit(Product product) {
		
		String img = "/resources/images/products/" + product.getProdImage();
		
		String sql = "update product set name = '"+product.getName()+"', unitPrice = '"+product.getUnitPrice()+"', brand = '"+product.getBrand()+"', description = '"+product.getDescription()+"',"
				+ "catID = '"+product.getCatID()+"', prodImage = '"+img+"' where prID = '"+product.getPrID()+"'";
		return template.update(sql);

	}

	public void delete(int prID, String comm) {
		String sql = "update product set status = '" + comm + "' where prID = '"+prID+"'";
		template.update(sql);

	}
	
	public void deleteAdmin(int prID, String comm) {
		String sql = "update product set admin = '" + comm + "' where prID = '"+prID+"'";
		template.update(sql);

	}
	
	public int checkAdminStatus (int prodID) {
		String sql = " select count(*) from product where prID = '"+prodID+"' AND admin = 'active'";
		return template.queryForObject(sql, Integer.class);
	}

	public Product getProduct(int productID) {
		String sql = "select * from product where prID = ?";
		return template.queryForObject(sql, new Object[] { productID },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getAllProduct() {
		return template.query("select * from product", new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product c = new Product();
				c.setPrID(rs.getInt(1));
				c.setSuppID(rs.getInt(2));
				c.setName(rs.getString(3));
				c.setDescription(rs.getString(4));
				c.setUnitPrice(rs.getString(5));
				c.setBrand(rs.getString(6));
				c.setCatID(rs.getInt(7));
				c.setProdImage(rs.getString(8));
				c.setAddedDate(rs.getString(9));
				c.setStatus(rs.getString(10));
				c.setAdmin(rs.getString(11));
				return c;
			}
		});
	}
	
	public List<Product> getAllProductActivated() {
		return template.query("select * from product where admin = 'active' and status = 'active'", new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product c = new Product();
				c.setPrID(rs.getInt(1));
				c.setSuppID(rs.getInt(2));
				c.setName(rs.getString(3));
				c.setDescription(rs.getString(4));
				c.setUnitPrice(rs.getString(5));
				c.setBrand(rs.getString(6));
				c.setCatID(rs.getInt(7));
				c.setProdImage(rs.getString(8));
				c.setAddedDate(rs.getString(9));
				c.setStatus(rs.getString(10));
				c.setAdmin(rs.getString(11));
				return c;
			}
		});
	}
	
	public List<Product> getAllProductSeller(int suppID) {
		return template.query(" select * from product where suppID = '"+suppID+"' ", new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product c = new Product();
				c.setPrID(rs.getInt(1));
				c.setName(rs.getString(3));
				c.setDescription(rs.getString(4));
				c.setUnitPrice(rs.getString(5));
				c.setBrand(rs.getString(6));
				c.setCatID(rs.getInt(7));
				c.setProdImage(rs.getString(8));
				c.setAddedDate(rs.getString(9));
				c.setStatus(rs.getString(10));
				c.setAdmin(rs.getString(11));
				return c;
			}
		});
	}

	public List searchProduct(String srch) {
		String search = "%" + srch + "%";
		String sql = "select * from product where prID like '"+search+"' OR suppID like '"+search+"' OR name like '"+search+"' OR unitPrice like '"+search+"'"
				+ " OR brand like '"+search+"' OR catID like '"+search+"' OR addedDate like '"+search+"' OR status like '"+search+"' ";
		return template.queryForList(sql);
	}
	
	public List searchProductSupplier(String srch, int suppID) {
		String search = "%" + srch + "%";
		String sql = "select * from product where (prID like '"+search+"' OR suppID like '"+search+"' OR name like '"+search+"' OR unitPrice like '"+search+"'"
				+ " OR brand like '"+search+"' OR catID like '"+search+"' OR addedDate like '"+search+"' OR status like '"+search+"') AND suppID = '"+suppID+"' ";
		return template.queryForList(sql);
	}
	
	public List clickCategory(int catID) {
		String sql = "select * from product where catID = '"+catID+"' and status = 'active'";
		return template.queryForList(sql);
	}
	
}
