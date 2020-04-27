package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Payment;


public class PaymentDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int add(Payment payment) {
		String sql = "insert into payment (payType, addedDate) values ('"+payment.getPayType()+"', NOW())";
		return template.update(sql);

	}

	public int edit(Payment payment) {
		String sql = "update payment set payType = '"+payment.getPayType()+"' where payID = '"+payment.getPayID()+"'";
		return template.update(sql);

	}

	public void delete(int paymentID, String comm) {
		String sql = "update	 payment set status = '" + comm + "' where payID = '"+paymentID+"'";
		template.update(sql);

	}

	public Payment getPayment(int paymentID) {
		String sql = "select * from payment where payID = ?";
		return template.queryForObject(sql, new Object[] { paymentID },
				new BeanPropertyRowMapper<Payment>(Payment.class));
	}

	public List<Payment> getAllPayment() {
		return template.query("select * from payment", new RowMapper<Payment>() {
			public Payment mapRow(ResultSet rs, int row) throws SQLException {
				Payment c = new Payment();
				c.setPayID(rs.getInt(1));
				c.setPayType(rs.getString(2));
				c.setStatus(rs.getString(3));
				c.setAddedDate(rs.getString(4));
				
				return c;
			}
		});
	}

	public List searchPayment(String srch) {
		String search = "%" + srch + "%";
		String sql = "select * from payment where payID like '"+search+"' OR payType like '"+search+"' OR status = '"+search+"' OR addedDate like '"+search+"'";
		return template.queryForList(sql);
	}
	
}
