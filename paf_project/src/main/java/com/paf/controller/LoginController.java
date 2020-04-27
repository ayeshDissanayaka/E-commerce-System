package com.paf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.AdminDao;
import com.paf.dao.CategoryDao;
import com.paf.dao.CustomerDao;
import com.paf.dao.ProductDao;
import com.paf.dao.SellerDao;
import com.paf.model.Admin;
import com.paf.model.Category;
import com.paf.model.Login;
import com.paf.model.Product;

@Controller
public class LoginController {

	@Autowired
	public CustomerDao dao;

	@Autowired
	public SellerDao dao1;

	@Autowired
	public AdminDao dao2;
	
	@Autowired
	public CategoryDao dao3;
	
	@Autowired
	public ProductDao dao4;

	@RequestMapping(value = "/accType")
	public ModelAndView selectAccount() {
		return new ModelAndView("accountType");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());

		return mav;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView goIndex(HttpServletRequest request, HttpServletResponse response, ModelAndView model, HttpSession session) {
		
		if(!(session.getAttribute("email") == null)) {
			return new ModelAndView("redirect:/home");
		}
		
		else {
			List<Category> listCategory = dao3.getAllCategory();
			List<Product> listProduct = dao4.getAllProduct();
			model.addObject("listCategory", listCategory);
			model.addObject("listProduct", listProduct);
			model.setViewName("index");
			return model;
		}
		
		
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView goHome(HttpServletRequest request, HttpServletResponse response, ModelAndView model, HttpSession session) {
		
		if(session.getAttribute("email") == null) {
			return new ModelAndView("redirect:/");
		}
		
		else {
			List<Category> listCategory = dao3.getAllCategoryActivated();
			List<Product> listProduct = dao4.getAllProductActivated();
			model.addObject("listCategory", listCategory);
			model.addObject("listProduct", listProduct);
			model.setViewName("home");
			return model;
		}
		
		
	}
	
	

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("admin");
		mav.addObject("admin", new Admin());

		return mav;
	}

	@RequestMapping(value = "/adminLogout")
	public ModelAndView adminLogin(HttpServletRequest request) {
		request.getSession().invalidate();
		return new ModelAndView("redirect:/admin");

	}
	
	@RequestMapping(value = "/userLogout")
	public ModelAndView userLogout(HttpServletRequest request) {
		request.getSession().invalidate();
		return new ModelAndView("redirect:/");

	}
	
	@RequestMapping(value = "/sellerLogout")
	public ModelAndView sellerLogout(HttpServletRequest request) {
		request.getSession().invalidate();
		return new ModelAndView("redirect:/");

	}

	@RequestMapping(value = "/loginProceedAdmin", method = RequestMethod.POST)
	public ModelAndView loginAdmin(HttpServletRequest request, ModelAndView model, HttpSession session) {
		String un = request.getParameter("username");
		String pw = request.getParameter("password");

		int opr = dao2.sellerLogin(un, pw);
		System.out.println(opr);

		if (opr == 1) {
			JOptionPane.showMessageDialog(null, "Login Sucessfull!", "Successfull", JOptionPane.INFORMATION_MESSAGE);

			session.invalidate();
			HttpSession newSession = request.getSession();
			newSession.setAttribute("emailAdmin", un);
			return new ModelAndView("redirect:/adminDashboard");
		}

		else {
			JOptionPane.showMessageDialog(null, "Invalid Credentials!", "Login Failed", JOptionPane.ERROR_MESSAGE);
			return new ModelAndView("redirect:/admin");
		}

	}
	
	

	@RequestMapping(value = "/loginProceed", method = RequestMethod.POST)
	public ModelAndView loginCustomer(HttpServletRequest request, ModelAndView model, HttpSession session) {
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		String opr = request.getParameter("optradio").toLowerCase();

		// System.out.println(opr);

		if (opr.equals("cus")) {
			int x = dao.customerLogin(un, pw);
			if (x == 1) {
				int ID = dao.getCustomerID(un, pw);
				JOptionPane.showMessageDialog(null, "Login Sucessfull!", "Successfull",
						JOptionPane.INFORMATION_MESSAGE);
				session.invalidate();
				HttpSession newSession = request.getSession();
				newSession.setAttribute("email", un);
				newSession.setAttribute("userID", ID);

				return new ModelAndView("redirect:/home");

			}

			else if (x == 2) {
				JOptionPane.showMessageDialog(null, "Sorry your account has been temporarily banned!", "Unsuccessfull",
						JOptionPane.ERROR_MESSAGE);
				return new ModelAndView("redirect:/");
			}

			else {
				JOptionPane.showMessageDialog(null, "Invalid Credentials, Please try again or Signup", "Error",
						JOptionPane.ERROR_MESSAGE);
				return new ModelAndView("redirect:/login");
			}
		}

		else if (opr.equals("sell")) {
			int x = dao1.sellerLogin(un, pw);
			if (x == 1) {
				int ID = dao1.getSellerID(un, pw);
				JOptionPane.showMessageDialog(null, "Login Sucessfull!", "Successfull",
						JOptionPane.INFORMATION_MESSAGE);
				session.invalidate();
				HttpSession newSession = request.getSession();
				newSession.setAttribute("emailSeller", un);
				newSession.setAttribute("userIDSeller", ID);

				return new ModelAndView("redirect:/sellerDashboard");

			}

			else if (x == 2) {
				JOptionPane.showMessageDialog(null, "Sorry you account has been temporarily banned!", "Unsuccessfull",
						JOptionPane.ERROR_MESSAGE);
				return new ModelAndView("redirect:/");
			}

			else {
				JOptionPane.showMessageDialog(null, "Invalid Credentials, Please try again or Signup", "Error",
						JOptionPane.ERROR_MESSAGE);
				return new ModelAndView("redirect:/login");
			}
		}

		return new ModelAndView("redirect:/");

	}

}
