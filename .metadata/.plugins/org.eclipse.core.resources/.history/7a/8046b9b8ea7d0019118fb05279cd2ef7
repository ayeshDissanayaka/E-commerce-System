package com.paf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.CategoryDao;
import com.paf.dao.ProductDao;
import com.paf.model.Category;
import com.paf.model.Product;

@Controller
public class ProductController {

	@Autowired
	public ProductDao dao;

	@Autowired
	public CategoryDao dao1;

	@RequestMapping(value = "/viewAllProduct")
	public ModelAndView viewAllProduct(ModelAndView model) {
		List<Product> listProduct = dao.getAllProduct();
		model.addObject("listProduct", listProduct);
		model.setViewName("product");

		return model;
	}

	@RequestMapping(value = "/searchProduct")
	public ModelAndView searchProduct(HttpServletRequest request, ModelAndView model) {
		String val = request.getParameter("searchVal");
		List<Product> listProduct = dao.searchProduct(val);
		model.addObject("listProduct", listProduct);
		model.setViewName("product");

		return model;
	}

	@RequestMapping(value = "/searchProductSeller")
	public ModelAndView searchProductSeller(HttpServletRequest request, ModelAndView model, HttpSession session) {
		String val = request.getParameter("searchVal");
		int suppID = Integer.parseInt(session.getAttribute("userIDSeller").toString());

		List<Product> listProductSeller = dao.searchProductSupplier(val, suppID);
		model.addObject("listProductSeller", listProductSeller);
		model.setViewName("SellerProduct");

		return model;
	}

	@RequestMapping(value = "/searchProductHome")
	public ModelAndView searchProductHome(HttpServletRequest request, ModelAndView model) {
		String val = request.getParameter("searchVal");
		List<Product> listProduct = dao.searchProduct(val);
		List<Category> listCategory = dao1.getAllCategory();

		if (listProduct.isEmpty()) {
			return new ModelAndView("redirect:/");
		}

		else {
			model.addObject("listProduct", listProduct);
			model.addObject("listCategory", listCategory);
			model.setViewName("index");
			return model;
		}

	}

	@RequestMapping(value = "/clickCategory")
	public ModelAndView clickCategory(HttpServletRequest request, ModelAndView model) {
		int catID = Integer.valueOf(request.getParameter("catID"));
		List<Product> listProduct = dao.clickCategory(catID);
		List<Category> listCategory = dao1.getAllCategory();

		if (listProduct.isEmpty()) {
			return new ModelAndView("redirect:/");
		}

		else {
			model.addObject("listProduct", listProduct);
			model.addObject("listCategory", listCategory);
			model.setViewName("index");
			return model;
		}

	}

	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public ModelAndView deleteProduct(HttpServletRequest request) {
		String comm = request.getParameter("command");
		int prID = Integer.parseInt(request.getParameter("prodID"));
		String user = request.getParameter("user");

		if (user.equals("admin")) {

			dao.deleteAdmin(prID, comm);

			if (comm.equals("active")) {
				JOptionPane.showMessageDialog(null, "Product Activated Sucessfully by Admin!", "Activation",
						JOptionPane.INFORMATION_MESSAGE);
			}

			else if (comm.equals("inactive")) {
				JOptionPane.showMessageDialog(null, "Product Deactivated Sucessfully by Admin!", "Activation",
						JOptionPane.INFORMATION_MESSAGE);
			}
			return new ModelAndView("redirect:/viewAllProduct");
		}

		else if (user.equals("seller")) {

			if (dao.checkAdminStatus(prID) == 1) {
				dao.delete(prID, comm);

				if (comm.equals("active")) {
					JOptionPane.showMessageDialog(null, "Product Activated Sucessfully!", "Activation",
							JOptionPane.INFORMATION_MESSAGE);
				}

				else if (comm.equals("inactive")) {
					JOptionPane.showMessageDialog(null, "Product Deactivated Sucessfully!", "Deactivation",
							JOptionPane.INFORMATION_MESSAGE);
				}
				
				return new ModelAndView("redirect:/viewAllProductSeller");
			}

			else {
				JOptionPane.showMessageDialog(null,
						"Sorry, You do not have the permission unless the Product is activated by Admin!",
						"Deactivation", JOptionPane.ERROR_MESSAGE);
				
				return new ModelAndView("redirect:/viewAllProductSeller");

			}

		}
		return new ModelAndView("redirect:/viewAllProductSeller");


	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public ModelAndView addProduct(ModelAndView model) {
		Product product = new Product();

		// Load C1tegory Dropdown
		List<Category> listCategory = dao1.getAllCategoryActivated();

		model.addObject("product", product);

		// Add Category List
		model.addObject("listCategory", listCategory);

		model.setViewName("addProduct");

		return model;
	}

	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public ModelAndView saveProduct(@ModelAttribute Product product, HttpSession session) {

		int suppID = Integer.parseInt(session.getAttribute("userID").toString());
		System.out.println("Session usr ID = " + suppID);
		int x = dao.add(product, suppID);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllProduct");
	}

	@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
	public ModelAndView editProduct(HttpServletRequest request) {
		int productID = Integer.parseInt(request.getParameter("pID"));
		Product product = dao.getProduct(productID);

		// Load CAtegory Dropdown
		List<Category> listCategory = dao1.getAllCategory();
		ModelAndView model = new ModelAndView("editProduct");
		model.addObject("product", product);
		model.addObject("listCategory", listCategory);
		return model;

	}

	@RequestMapping(value = "/editSaveProduct", method = RequestMethod.POST)
	public ModelAndView editSaveProduct(@ModelAttribute Product product) {
		int x = dao.edit(product);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllProductSeller");
	}

}
