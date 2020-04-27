package com.paf.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.PurchaseDao;
import com.paf.model.Purchase;

@Controller
public class PurchaseController {
	
	@Autowired
	public PurchaseDao dao;
	
	@RequestMapping(value = "/viewAllPurchase")
	public ModelAndView viewAllPurchase(ModelAndView model, HttpSession session) {
		
		if(session.getAttribute("userID") == null) {
			return new ModelAndView("/login");
		}
		
		else {
			int cusID = Integer.valueOf(session.getAttribute("userID").toString());
			List<Purchase> listPurchase = dao.getAllPurchases(cusID);
			model.addObject("listPurchase", listPurchase);
			model.setViewName("purchase");

			return model;
		}
		
		
	}

}
