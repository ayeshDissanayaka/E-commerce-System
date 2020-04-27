package com.paf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.SellerOrderDao;
import com.paf.model.Seller;
import com.paf.model.SellerOrder;

@Controller
public class SellerOrderController {

	@Autowired
	public SellerOrderDao dao;

	@RequestMapping(value = "/viewAllOrderSeller")
	public ModelAndView viewAllOrderSeller(ModelAndView model, HttpSession session) {
		
		if(session.getAttribute("userIDSeller") == null) {
			return new ModelAndView("redirect:/login");
		}
		
		else {
			int sellerID = Integer.parseInt(session.getAttribute("userIDSeller").toString());
			
			List<SellerOrder> listSellerOrder = dao.getAllSellerOrder(sellerID);
			model.addObject("listSellerOrder", listSellerOrder);
			model.setViewName("sellerOrder");

			return model;
		}
		
		
	}
	
	@RequestMapping(value = "/searchSellerOrder")
	public ModelAndView searchSellerOrder(ModelAndView model, HttpSession session, HttpServletRequest request) {
		
		int sellerID = Integer.parseInt(session.getAttribute("userIDSeller").toString());
		String val = request.getParameter("searchVal");
		
		List<SellerOrder> listSellerOrder = dao.searchSellerOrder(sellerID, val);
		model.addObject("listSellerOrder", listSellerOrder);
		model.setViewName("sellerOrder");

		return model;
		
	}
	
	@RequestMapping(value = "/deleteSellerOrder", method = RequestMethod.GET)
	public ModelAndView deleteSellerOrder(HttpServletRequest request) {
		String comm = request.getParameter("command");
		int itemID = Integer.parseInt(request.getParameter("itemID"));
		
		if (comm.equals("active")) {
			dao.deleteSellerOrder(itemID, "shipped");
			JOptionPane.showMessageDialog(null, "Order marked as Shipped Sucessfully!", "Activation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		else if (comm.equals("inactive")) {
			dao.deleteSellerOrder(itemID, "pending");
			JOptionPane.showMessageDialog(null, "Order not marked as Shipped Successfully!", "Deactivation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		return new ModelAndView("redirect:/viewAllOrderSeller");

	}

}
