package com.paf.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class AdminDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;
	
	public int sellerLogin(String un, String pw) {

		String sql = "select count(*) from admin where username = '" + un + "' AND password = '" + pw + "'";
		int cnt = template.queryForObject(sql, Integer.class);

		if (cnt >= 1) {
			return 1;
		}

		else {
			return 0;
		}

	}
	
	public void delete(int prID, String comm) {
		String sql = "update product set admin = '" + comm + "' where prID = '"+prID+"'";
		template.update(sql);

	}
	
}
