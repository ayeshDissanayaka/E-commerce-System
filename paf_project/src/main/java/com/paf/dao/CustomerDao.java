package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Customer;
import com.paf.model.Login;

public class CustomerDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int add(Customer customer) {
		String sql = "INSERT INTO customer(fname, lname, email, phone, country, dob, city, postal, address1, address2, password, regDate, status) "
				+ "VALUES ('" + customer.getFname() + "', '" + customer.getLname() + "', '" + customer.getEmail()
				+ "', '" + customer.getPhone() + "', '" + customer.getCountry() + "'," + "'" + customer.getDob()
				+ "', '" + customer.getCity() + "', '" + customer.getPostal() + "', '" + customer.getAddress1() + "', '"
				+ customer.getAddress2() + "'," + "'" + customer.getPassword() + "', NOW(), 'active')";
		
		
		try
		{
			return template.update(sql);
		}
		catch (DataAccessException e)
		{
		   return 2;
		}

	}

	public int edit(Customer customer) {
		String sql = "update customer set fname = '" + customer.getFname() + "', lname = '" + customer.getLname()
				+ "', phone = '" + customer.getPhone() + "', country = '"
				+ customer.getCountry() + "', dob = '" + customer.getDob() + "', city = '" + customer.getCity() + "', "
				+ "postal = '" + customer.getPostal() + "', address1 = '" + customer.getAddress1() + "', address2 = '"
				+ customer.getAddress2() + "', " + "password = '" + customer.getPassword() + "' where cusID = '"
				+ customer.getCusID() + "'";

		return template.update(sql);

	}

	public void delete(int customerID, String comm) {
		String sql = "update customer set status = '" + comm + "' where cusID = '" + customerID + "'";
		template.update(sql);

	}

	public Customer getCustomer(int customerID) {
		String sql = "select * from customer where cusID = ?";
		return template.queryForObject(sql, new Object[] { customerID },
				new BeanPropertyRowMapper<Customer>(Customer.class));
	}

	public List<Customer> getAllCustomer() {
		return template.query("select * from customer", new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCusID(rs.getInt(1));
				c.setFname(rs.getString(2));
				c.setLname(rs.getString(3));
				c.setEmail(rs.getString(4));
				c.setPhone(rs.getString(5));
				c.setCountry(rs.getString(6));
				c.setDob(rs.getString(7));
				c.setCity(rs.getString(8));
				c.setPostal(rs.getString(9));
				c.setAddress1(rs.getString(10));
				c.setAddress2(rs.getString(11));
				c.setPassword(rs.getString(12));
				c.setRegDate(rs.getString(13));
				c.setStatus(rs.getString(14));
				return c;
			}
		});
	}

	public List searchCustomer(String srch) {
		String search = "%" + srch + "%";
		String sql = "select * from customer where cusID like '" + search + "' OR fname like '" + search
				+ "' OR lname like '" + search + "' OR email like '" + search + "'" + " OR phone like '" + search
				+ "' OR country like '" + search + "' OR dob like '" + search + "' OR city like '" + search + "'"
				+ " OR postal like '" + search + "' OR address1 like '" + search + "' OR address2 like '" + search
				+ "' OR regDate like '" + search + "' OR status like '" + search + "'";
		return template.queryForList(sql);
	}

	public int customerLogin(String un, String pw) {

		String sql = "select count(*) from customer where email = '" + un + "' AND password = '" + pw
				+ "' AND status = 'active'";
		int cnt = template.queryForObject(sql, Integer.class);

		if (cnt >= 1) {
			return 1;
		}

		else {
			String sql1 = "select count(*) from customer where email = '" + un + "' AND password = '" + pw
					+ "' AND status = 'inactive'";
			int cnt1 = template.queryForObject(sql1, Integer.class);

			if (cnt1 >= 1) {
				return 2;
			}

			else {
				return 3;
			}
		}

	}

	public int getCustomerID(String un, String pw) {

	
			String sql = "select cusID from customer where email = '" + un + "' AND password = '" + pw
					+ "' AND status = 'active'";

			int cusID = template.queryForObject(sql, Integer.class);
			return cusID;
		

	}

}
