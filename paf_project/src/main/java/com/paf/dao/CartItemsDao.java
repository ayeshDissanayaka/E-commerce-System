package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.CartItems;

public class CartItemsDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;
	
	public int getCurrentAddedCount(int cartID, int prodID) {
		String sql = "select count(*) from cartitems i, cart c where c.lineID = i.cartID AND i.productID = '"+prodID+"' AND c.status = 'active'";
		int cnt = template.queryForObject(sql, Integer.class);
		return cnt;
	}
	
	public int addProduct(int cartID, int prodID) {
		String sql = "insert into cartitems (cartID, productID, qty) values('"+cartID+"', '"+prodID+"',"
				+ "'1')";
		
		return template.update(sql);
	}
	
	public int editCart(CartItems c, int itemID) {
		String sql = "update cartitems set qty = '"+c.getQty()+"' where itemID = '"+itemID+"'";
		
		return template.update(sql);
	}
	
	public int removeCartItem(int itemID) {
		String sql = "delete from cartitems where itemID = '"+itemID+"'";
		
		return template.update(sql);
	}
	
	public int setItemStatus(int cartID) {
		String sql = "update cartitems set status = 'pending' where cartID = '"+cartID+"' ";
		return template.update(sql);
	}
	

	
	public List<CartItems> getAllCart(int cusID) {
		return template.query("select * from cart c, cartitems i, product p where c.lineID = i.cartID AND i.productID = p.prID AND c.cusID = '"+cusID+"' AND c.status = 'active'",
				new RowMapper<CartItems>() {
					public CartItems mapRow(ResultSet rs, int row) throws SQLException {
						CartItems c = new CartItems();
						c.setItemID(rs.getInt(6));
						c.setCartID(rs.getInt(7));
						c.setProductID(rs.getInt(8));
						c.setQty(rs.getInt(9));
						c.setProdName(rs.getString(13));
						c.setDescription(rs.getString(14));
						c.setPrice(rs.getInt(15));
						c.setProdImage(rs.getString(18));
						return c;
					}
				});
	}
	
	
	

	
}
