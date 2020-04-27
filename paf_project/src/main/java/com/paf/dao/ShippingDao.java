package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Shipping;



public class ShippingDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int add(Shipping shipping) {
		String sql = "insert into shipping (company, addedDate) values ('"+shipping.getCompany()+"', NOW())";
		return template.update(sql);

	}

	public int edit(Shipping shipping) {
		String sql = "update shipping set company = '"+shipping.getCompany()+"' where shipID = '"+shipping.getShipID()+"'";
		return template.update(sql);

	}

	public void delete(int shipID, String comm) {
		String sql = "update shipping set status = '" + comm + "' where shipID = '"+shipID+"'";
		template.update(sql);

	}

	public Shipping getShipping(int shippingID) {
		String sql = "select * from shipping where shipID = ?";
		return template.queryForObject(sql, new Object[] { shippingID },
				new BeanPropertyRowMapper<Shipping>(Shipping.class));
	}

	public List<Shipping> getAllShipping() {
		return template.query("select * from shipping", new RowMapper<Shipping>() {
			public Shipping mapRow(ResultSet rs, int row) throws SQLException {
				Shipping c = new Shipping();
				c.setShipID(rs.getInt(1));
				c.setCompany(rs.getString(2));
				c.setStatus(rs.getString(3));
				c.setAddedDate(rs.getString(4));
				return c;
			}
		});
	}

	public List searchShipping(String srch) {
		String search = "%" + srch + "%";
		String sql = "select * from shipping where shipID like '"+search+"' OR company like '"+search+"' OR status like '"+search+"' OR addedDate like '"+search+"'"
				+ " OR addedDate like '"+search+"' ";
		return template.queryForList(sql);
	}
	
}
