package com.paf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.CartDao;
import com.paf.dao.CartItemsDao;
import com.paf.dao.CusOrderDao;
import com.paf.model.CusOrder;




@Controller
public class CusOrderController {

	@Autowired
	public CusOrderDao dao;
	
	@Autowired
	public CartDao dao1;
	
	@Autowired
	public CartItemsDao dao2;
	
	@RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
	public ModelAndView saveOrder(@ModelAttribute CusOrder cusOrder, HttpServletRequest request) {
		
		int value = JOptionPane.showConfirmDialog(null, "Are you sure you want to Checkout the items ?");
		if(value == 0) {
			
			int cartID = Integer.valueOf(request.getParameter("cartID"));
			int x = dao.add(cusOrder);
			int y = dao1.clearCart(cartID);
			int z = dao2.setItemStatus(cartID);
			
			if(x == 1 && y == 1 && z == 1) {
				JOptionPane.showMessageDialog(null, "Order added Successfully!", "Activation",
						JOptionPane.INFORMATION_MESSAGE);
			}
			
			else {
				JOptionPane.showMessageDialog(null, "Order not addded Successfully!", "Activation",
						JOptionPane.ERROR_MESSAGE);
			}
			
			return new ModelAndView("redirect:/home");
			
		}
		
		else {
			return new ModelAndView("redirect:/viewAllCartItems");
		}
		
		
	}
	
}
