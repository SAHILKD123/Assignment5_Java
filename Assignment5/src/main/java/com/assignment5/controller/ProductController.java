package com.assignment5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment5.dao.ProductDao;
import com.assignment5.model.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductDao productDao;

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("products", productDao.getAllProducts());
		return "index";
	}

	@GetMapping("/AddProduct")
	public String AddProduct() {
		return "add";
	}

	@PostMapping("/AddProduct")
	public String addProduct(@RequestParam("productId") int productId, @RequestParam("productName") String productName,
			@RequestParam("quantity") int quantity) {
		// Create a new Product object
		Product product = new Product(productId, productName, quantity);
		product.setId(productId);
		product.setName(productName);
		product.setQuantity(quantity);

		// Add the product to the database
		productDao.save(product);

		// Redirect to the product list page
		return "redirect:/";
	}

	@GetMapping("/updateForm")
	public String showUpdateForm(@RequestParam("productId") int productId, Model model) {
		Product product = productDao.getProductById(productId);

		model.addAttribute("product", product);
		return "update";
	}

	@PostMapping("/updateProduct")
	public String updateProduct(@RequestParam("id") int productId, @RequestParam("productName") String productName,
			@RequestParam("quantity") int quantity) {
	    // Retrieve the product details from the form
	    
	    // Fetch the existing product from the database
	    Product existingProduct = productDao.getProductById(productId);
	    
	    // Update the product details
	    if (existingProduct != null) {
	        existingProduct.setName(productName);
	        existingProduct.setQuantity(quantity);
	        
	        // Update the product in the database
	        productDao.update(existingProduct);
	    }
	    
	    // Redirect to the product list page
	    return "redirect:/";
	}

	@PostMapping("/addProduct")
	public String addProduct(@RequestParam("productId") int productId) {
		Product product = productDao.getProductById(productId);
		if (product != null) {
			product.setQuantity(product.getQuantity() + 1);
			productDao.update(product);
		}
		return "redirect:/";
	}

	@PostMapping("/removeProduct")
	public String removeProduct(@RequestParam("productId") int productId) {
		Product product = productDao.getProductById(productId);
		if (product != null) {
			// Decrease product quantity by 1
			int newQuantity = product.getQuantity() - 1;
			if (newQuantity > 0) {
				// Update product quantity if it's still positive
				product.setQuantity(newQuantity);
				productDao.update(product);
			} else {
				// Remove product if quantity becomes 0
				productDao.delete(productId);
			}
		}
		return "redirect:/";
	}

}
