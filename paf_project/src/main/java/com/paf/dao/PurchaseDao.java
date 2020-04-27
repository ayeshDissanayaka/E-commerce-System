package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Purchase;


public class PurchaseDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;
	
	public List<Purchase> getAllPurchases(int cusID) {
		return template.query("SELECT * " + 
				"from cart c, cartitems i, product p, customer cus, cusorder ord, shipping s, payment pay " + 
				"where c.lineID = i.cartID AND i.productID = p.prID AND cus.cusID = c.cusID AND ord.cartID = c.lineID AND s.shipID = ord.shipID AND pay.payID = ord.payID AND c.cusID = '"+cusID+"' order by ord.orderID desc", new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase c = new Purchase();
				c.setProdImage(rs.getString(18));
				c.setOrderID(rs.getInt(36));
				c.setProductID(rs.getInt(8));
				c.setName(rs.getString(13));
				c.setPrice(rs.getDouble(15));
				c.setQty(rs.getInt(9));
				c.setPayName(rs.getString(48));
				c.setCompany(rs.getString(43));
				c.setCheckedDate(rs.getString(4));
				
				return c;
			}
		});
	}
	
}
