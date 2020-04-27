package com.paf.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.CustomerDao;
import com.paf.model.Customer;
import com.paf.model.Login;



@Controller
public class CustomerController {
	/*
	 * @Autowired private CustomerDao dao;
	 * 
	 * @RequestMapping("/index") public String setupForm(Map<String, Object> map) {
	 * Customer customer = new Customer(); map.put("customer", customer);
	 * map.put("customerList", dao.getAllCustomer()); return "customer"; }
	 * 
	 * @RequestMapping(value = "/customer.search", method = RequestMethod.POST)
	 * public String doActions1(@ModelAttribute Customer customer, BindingResult
	 * result, @RequestParam String searchVal, Map<String, Object> map) {
	 * 
	 * Customer customerResult = new Customer(); System.out.println(searchVal);
	 * map.put("customer", customerResult); map.put("customerList",
	 * dao.searchCustomer(searchVal)); return "customer"; }
	 * 
	 * @RequestMapping(value = "/customer.do", method = RequestMethod.POST) public
	 * String doActions(@ModelAttribute Customer customer, BindingResult
	 * result, @RequestParam String action, Map<String, Object> map) { Customer
	 * customerResult = new Customer(); String opr = action.toLowerCase();
	 * 
	 * if (opr.equals("add")) { dao.add(customer); customerResult = customer;
	 * 
	 * map.put("customer", customerResult); map.put("customerList",
	 * dao.getAllCustomer()); return "customer"; }
	 * 
	 * else if (opr.equals("edit")) { dao.edit(customer); customerResult = customer;
	 * 
	 * map.put("customer", customerResult); map.put("customerList",
	 * dao.getAllCustomer()); return "customer"; }
	 * 
	 * else if (opr.equals("delete")) { dao.delete(customer.getCusID());
	 * customerResult = new Customer();
	 * 
	 * map.put("customer", customerResult); map.put("customerList",
	 * dao.getAllCustomer()); return "customer"; }
	 * 
	 * else if (opr.equals("load")) { System.out.println(customer.getCusID());
	 * Customer searchedCustomer = dao.getCustomer(customer.getCusID());
	 * customerResult = searchedCustomer != null ? searchedCustomer : new
	 * Customer(); map.put("customer", customerResult); return "customerEdit";
	 * //return null; }
	 * 
	 * else { map.put("customer", customerResult); map.put("customerList",
	 * dao.getAllCustomer()); return "customer"; } }
	 */

	@Autowired
	public CustomerDao dao;

	@RequestMapping(value = "/viewAllCustomer")
	public ModelAndView viewAllCustomer(ModelAndView model) {
		List<Customer> listCustomer = dao.getAllCustomer();
		model.addObject("listCustomer", listCustomer);
		model.setViewName("customer");

		return model;
	}

	@RequestMapping(value = "/searchCustomer")
	public ModelAndView searchCustomer(HttpServletRequest request, ModelAndView model) {
		String val = request.getParameter("searchVal");
		List<Customer> listCustomer = dao.searchCustomer(val);
		model.addObject("listCustomer", listCustomer);
		model.setViewName("customer");

		return model;
	}

	@RequestMapping(value = "/deleteCustomer", method = RequestMethod.GET)
	public ModelAndView deleteCustomer(HttpServletRequest request) {
		String comm = request.getParameter("command");
		int cusID = Integer.parseInt(request.getParameter("cusID"));
		dao.delete(cusID, comm);

		if (comm.equals("active")) {
			JOptionPane.showMessageDialog(null, "Customer Activated Sucessfully!", "Activation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		else if (comm.equals("inactive")) {
			JOptionPane.showMessageDialog(null, "Customer Deactivated Sucessfully!", "Deactivation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		return new ModelAndView("redirect:/viewAllCustomer");

	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.GET)
	public ModelAndView addCustomer(ModelAndView model) {
		Customer customer = new Customer();
		model.addObject("customer", customer);
		model.setViewName("addCustomer");
		return model;
	}

	@RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public ModelAndView saveCustomer(@ModelAttribute Customer customer) {
		int x = dao.add(customer);
		if(x == 2) {
			JOptionPane.showMessageDialog(null, "Email already exists!", "Error",
					JOptionPane.ERROR_MESSAGE);
			return new ModelAndView("redirect:/addCustomer");
		}
		
		else {
			JOptionPane.showMessageDialog(null, "You have been successfully registered!", "Error",
					JOptionPane.INFORMATION_MESSAGE);
			return new ModelAndView("redirect:/login");
		}	
	}
	
	@RequestMapping(value = "/editCustomer", method = RequestMethod.GET)
    public ModelAndView editCustomer(HttpServletRequest request, HttpSession session) {
        int customerID = Integer.parseInt(session.getAttribute("userID").toString());
        Customer customer = dao.getCustomer(customerID);
        ModelAndView model = new ModelAndView("editCustomer");
        model.addObject("customer", customer);
 
        return model;
    }
	
	@RequestMapping(value = "/editSaveCustomer", method = RequestMethod.POST)
	public ModelAndView editSaveCustomer(@ModelAttribute Customer customer) {
		int x = dao.edit(customer);
		System.out.println(x);
		return new ModelAndView("redirect:/home");
	}
	
	 

}
