package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.SellerOrder;



public class SellerOrderDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;
	
	public List<SellerOrder> getAllSellerOrder(int sellerID) {
		return template.query(" SELECT * from seller s, product p, cartitems i, cart c, cusorder o where s.suppID = p.suppID "
				+ "AND i.productID = p.prID AND c.lineID = i.cartID AND o.cartID = c.lineID AND i.status is not null "
				+ "AND s.suppID = '"+sellerID+"' ", new RowMapper<SellerOrder>() {
			public SellerOrder mapRow(ResultSet rs, int row) throws SQLException {
				SellerOrder c = new SellerOrder();
				c.setOrderID(rs.getInt(37));
				c.setProductID(rs.getInt(29));
				c.setQty(rs.getInt(30));
				c.setTotal(rs.getInt(30) * rs.getDouble(20));
				c.setOrderDate(rs.getString(40));
				c.setStatus(rs.getString(31));
				c.setItemID(rs.getInt(27));
				c.setProdName(rs.getString(18));
				
				return c;
			}
		});
	}
	
	public int deleteSellerOrder(int itemID, String command) {
		String sql = "update cartitems set status = '"+command+"' where itemID = '"+itemID+"' " ;
		return template.update(sql);
	}
	
	public List searchSellerOrder(int sellerID , String srch) {
		String search = "%" + srch + "%";
		String sql = "SELECT * from seller s, product p, cartitems i, cart c, cusorder o where s.suppID = p.suppID AND"
				+ " i.productID = p.prID AND c.lineID = i.cartID AND o.cartID = c.lineID AND i.status is not null AND s.suppID = '"+sellerID+"' "
				+ "AND ( o.orderID like '"+search+"' OR p.prID like '"+search+"' OR i.qty like '"+search+"' OR "
						+ "(i.qty * p.unitPrice) like  '"+search+"' OR o.billDate like  '"+search+"' OR "
								+ "i.status like  '"+search+"' OR  i.itemID like  '"+search+"' OR p.name like  '"+search+"')";
		
		return template.query(sql, new RowMapper<SellerOrder>() {
			public SellerOrder mapRow(ResultSet rs, int row) throws SQLException {
				SellerOrder c = new SellerOrder();
				c.setOrderID(rs.getInt(37));
				c.setProductID(rs.getInt(29));
				c.setQty(rs.getInt(30));
				c.setTotal(rs.getInt(30) * rs.getDouble(20));
				c.setOrderDate(rs.getString(40));
				c.setStatus(rs.getString(31));
				c.setItemID(rs.getInt(27));
				c.setProdName(rs.getString(18));
				
				return c;
			}
		});
		
	}
	
}
