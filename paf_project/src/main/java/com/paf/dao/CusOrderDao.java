package com.paf.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.paf.model.CusOrder;


public class CusOrderDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int add(CusOrder cusOrder) {
		String sql = "insert into cusorder (cartID, payID, billDate, total, shipID) values ('"+cusOrder.getCartID()+"', '"+cusOrder.getPayID()+"', NOW(),"
				+ "'"+cusOrder.getTotal()+"', '"+cusOrder.getShipID()+"')";
		return template.update(sql);

	}

	
}
