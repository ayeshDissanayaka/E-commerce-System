package com.paf.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.paf.model.Category;



public class CategoryDao {

	@Autowired
	JdbcTemplate template;

	@Autowired
	DataSource datasource;

	public int add(Category category) {
		String sql = "insert into category (description, catName, addedDate) values ('"+category.getDescription()+"', '"+category.getCatName()+"', NOW())";
		return template.update(sql);

	}

	public int edit(Category category) {
		String sql = "update category set description = '"+category.getDescription()+"', catName = '"+category.getCatName()+"' where catID = '"+category.getCatID()+"'";
		return template.update(sql);

	}

	public void delete(int categoryID, String comm) {
		String sql = "update category set status = '" + comm + "' where catID = '" + categoryID + "'";
		template.update(sql);

	}

	public Category getCategory(int categoryID) {
		String sql = "select * from category where catID = ?";
		return template.queryForObject(sql, new Object[] { categoryID },
				new BeanPropertyRowMapper<Category>(Category.class));
	}

	public List<Category> getAllCategory() {
		return template.query("select * from category", new RowMapper<Category>() {
			public Category mapRow(ResultSet rs, int row) throws SQLException {
				Category c = new Category();
				c.setCatID(rs.getInt(1));
				c.setDescription(rs.getString(2));
				c.setCatName(rs.getString(3));
				c.setStatus(rs.getString(4));
				c.setAddedDate(rs.getString(5));
				return c;
			}
		});
	}
	
	public List<Category> getAllCategoryActivated() {
		return template.query("select * from category where status = 'active'", new RowMapper<Category>() {
			public Category mapRow(ResultSet rs, int row) throws SQLException {
				Category c = new Category();
				c.setCatID(rs.getInt(1));
				c.setDescription(rs.getString(2));
				c.setCatName(rs.getString(3));
				c.setStatus(rs.getString(4));
				c.setAddedDate(rs.getString(5));
				return c;
			}
		});
	}

	public List searchCategory(String srch) {
		String search = "%" + srch + "%";
		String sql = "select * from category where catID like '"+search+"' OR description like '"+search+"' OR catName like '"+search+"' OR status like '"+search+"'"
				+ " OR addedDate like '"+search+"' ";
		return template.queryForList(sql);
	}
	
}
