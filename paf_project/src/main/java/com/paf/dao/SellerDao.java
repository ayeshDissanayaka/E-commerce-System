package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Seller;

public class SellerDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int add(Seller seller) {
		String sql = "INSERT INTO seller(company, fname, lname, email, phone, country, dob, city, password, state, address1, address2, regDate, status) "
				+ "VALUES ('" + seller.getCompany() + "', '" + seller.getFname() + "', '" + seller.getLname() + "', '"
				+ seller.getEmail() + "'," + " '" + seller.getPhone() + "', '" + seller.getCountry() + "', '"
				+ seller.getDob() + "', '" + seller.getCity() + "', '" + seller.getPassword() + "', " + "'"
				+ seller.getState() + "', '" + seller.getAddress1() + "', '" + seller.getAddress2()
				+ "', NOW(), 'active')";
		try {
			return template.update(sql);
		} catch (DataAccessException e) {
			return 2;
		}

	}

	public int edit(Seller seller) {
		String sql = "update seller set company = '" + seller.getCompany() + "', fname = '" + seller.getFname()
				+ "', lname = '" + seller.getLname() + "', phone = '"
				+ seller.getPhone() + "', country = '" + seller.getCountry() + "', dob = '" + seller.getDob()
				+ "', city = '" + seller.getCity() + "', " + "address1 = '" + seller.getAddress1() + "', state = '"
				+ seller.getState() + "', " + "address2 = '" + seller.getAddress2() + "', password = '"
				+ seller.getPassword() + "' where suppID = '" + seller.getSuppID() + "'";

		return template.update(sql);

	}

	public void delete(int suppID, String comm) {
		String sql = "update seller set status = '" + comm + "' where suppID = '" + suppID + "'";
		template.update(sql);

	}

	public Seller getSeller(int suppID) {
		String sql = "select * from seller where suppID = ?";
		return template.queryForObject(sql, new Object[] { suppID }, new BeanPropertyRowMapper<Seller>(Seller.class));
	}

	public List<Seller> getAllSeller() {
		return template.query("select * from seller", new RowMapper<Seller>() {
			public Seller mapRow(ResultSet rs, int row) throws SQLException {
				Seller c = new Seller();
				c.setSuppID(rs.getInt(1));
				c.setCompany(rs.getString(2));
				c.setFname(rs.getString(3));
				c.setLname(rs.getString(4));
				c.setEmail(rs.getString(5));
				c.setPhone(rs.getString(6));
				c.setCountry(rs.getString(7));
				c.setDob(rs.getString(8));
				c.setCity(rs.getString(9));
				c.setPassword(rs.getString(10));
				c.setState(rs.getString(11));
				c.setAddress1(rs.getString(12));
				c.setAddress2(rs.getString(13));
				c.setRegDate(rs.getString(14));
				c.setStatus(rs.getString(15));
				return c;
			}
		});
	}

	public List searchSeller(String srch) {
		String search = "%" + srch + "%";
		String sql = "select * from seller where suppID like '" + search + "' OR company like '" + search
				+ "' OR fname like '" + search + "' OR lname like '" + search + "' OR email like '" + search + "'"
				+ " OR phone like '" + search + "' OR country like '" + search + "' OR dob like '" + search
				+ "' OR city like '" + search + "'" + " OR state like '" + search + "' OR address1 like '" + search
				+ "' OR address2 like '" + search + "' OR regDate like '" + search + "' OR status like '" + search
				+ "'";
		return template.queryForList(sql);
	}

	public int sellerLogin(String un, String pw) {

		String sql = "select count(*) from seller where email = '" + un + "' AND password = '" + pw
				+ "' AND status = 'active'";
		int cnt = template.queryForObject(sql, Integer.class);

		if (cnt >= 1) {
			return 1;
		}

		else {
			String sql1 = "select count(*) from seller where email = '" + un + "' AND password = '" + pw
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

	public int getSellerID(String un, String pw) {

		String sql = "select suppID from seller where email = '" + un + "' AND password = '" + pw
				+ "' AND status = 'active'";

		int cusID = template.queryForObject(sql, Integer.class);
		return cusID;

	}

}
