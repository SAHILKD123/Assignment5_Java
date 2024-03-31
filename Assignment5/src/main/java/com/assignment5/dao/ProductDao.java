package com.assignment5.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.assignment5.model.Product;

public class ProductDao {

	private JdbcTemplate jdbcTemplate;

	public ProductDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(Product product) {
		String sql = "INSERT INTO product (id, name, quantity) VALUES (?, ?, ?)";
		return jdbcTemplate.update(sql, product.getId(), product.getName(), product.getQuantity());
	}

	public int update(Product product) {
		String sql = "UPDATE product SET quantity = ? WHERE name = ?";
		return jdbcTemplate.update(sql, product.getQuantity(), product.getName());
	}

	public int delete(int id) {
		String sql = "DELETE FROM product WHERE id = ?";
		return jdbcTemplate.update(sql, id);
	}

	@SuppressWarnings("deprecation")
	public Product getProductByName(String name) {
		String sql = "SELECT * FROM product WHERE name = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { name }, new BeanPropertyRowMapper<>(Product.class));
	}

	@SuppressWarnings("deprecation")
	public Product getProductById(int id) {
		String sql = "SELECT * FROM product WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(Product.class));
	}

	public List<Product> getAllProducts() {
		String sql = "SELECT * FROM product";
		return jdbcTemplate.query(sql, new ProductRowMapper());
	}

	private class ProductRowMapper implements RowMapper<Product> {
		@Override
		public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
			Product product = new Product();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("name"));
			product.setQuantity(rs.getInt("quantity"));
			return product;
		}
	}
}
