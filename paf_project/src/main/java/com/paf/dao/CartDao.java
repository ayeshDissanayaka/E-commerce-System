package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Cart;

public class CartDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int searchCount(int userID) {
		String sql = "select count(*) from cart where cusID = '" + userID + "' AND status = 'active'";
		return template.queryForObject(sql, Integer.class);
	}

	public void add(int cusID) {

		String sql = "insert into cart (cusID, addedDate) values ('" + cusID + "', NOW())";
		template.update(sql);

	}
	
	public int getCartID(int cusID) {
		String sql = "select lineID from cart where cusID = '" + cusID + "' AND status = 'active'";
		return template.queryForObject(sql, Integer.class);
	}
	
	public int clearCart(int cartID) { 
		String sql = "update cart set status = 'inactive', checkedDate = NOW() where lineID = '"+cartID+"' ";
		return template.update(sql);
	}

	public List<Cart> getAllCart(int cusID) {
		return template.query("select * from cart where cusID = '" + cusID + "' AND status = 'active'",
				new RowMapper<Cart>() {
					public Cart mapRow(ResultSet rs, int row) throws SQLException {
						Cart c = new Cart();
						c.setLineID(rs.getInt(1));
						c.setCusID(rs.getInt(2));
						c.setAddedDate(rs.getString(3));
						c.setCheckedDate(rs.getString(4));
						c.setStatus(rs.getString(5));
						return c;
					}
				});
	}

}
