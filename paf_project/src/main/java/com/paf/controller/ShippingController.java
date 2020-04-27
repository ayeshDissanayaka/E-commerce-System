package com.paf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.ShippingDao;
import com.paf.model.Shipping;


@Controller
public class ShippingController {

	@Autowired
	public ShippingDao dao;

	@RequestMapping(value = "/viewAllShipping")
	public ModelAndView viewAllShipping(ModelAndView model) {
		List<Shipping> listShipping = dao.getAllShipping();
		model.addObject("listShipping", listShipping);
		model.setViewName("shipping");

		return model;
	}

	@RequestMapping(value = "/searchShipping")
	public ModelAndView searchShipping(HttpServletRequest request, ModelAndView model) {
		String val = request.getParameter("searchVal");
		List<Shipping> listShipping = dao.searchShipping(val);
		model.addObject("listShipping", listShipping);
		model.setViewName("shipping");

		return model;
	}

	@RequestMapping(value = "/deleteShipping", method = RequestMethod.GET)
	public ModelAndView deleteShipping(HttpServletRequest request) {
		String comm = request.getParameter("command");
		int shipID = Integer.parseInt(request.getParameter("shipID"));
		dao.delete(shipID, comm);

		if (comm.equals("active")) {
			JOptionPane.showMessageDialog(null, "Shipping Company Activated Sucessfully!", "Activation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		else if (comm.equals("inactive")) {
			JOptionPane.showMessageDialog(null, "Shipping Company Deactivated Sucessfully!", "Deactivation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		return new ModelAndView("redirect:/viewAllShipping");

	}

	@RequestMapping(value = "/addShipping", method = RequestMethod.GET)
	public ModelAndView addShipping(ModelAndView model) {
		Shipping shipping = new Shipping();
		model.addObject("shipping", shipping);
		model.setViewName("addShipping");
		return model;
	}

	@RequestMapping(value = "/saveShipping", method = RequestMethod.POST)
	public ModelAndView saveShipping(@ModelAttribute Shipping shipping) {
		int x = dao.add(shipping);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllShipping");
	}
	
	@RequestMapping(value = "/editShipping", method = RequestMethod.GET)
    public ModelAndView editShipping(HttpServletRequest request) {
        int shippingID = Integer.parseInt(request.getParameter("sID"));
        Shipping shipping = dao.getShipping(shippingID);
        ModelAndView model = new ModelAndView("editShipping");
        model.addObject("shipping", shipping);
 
        return model;
    }
	
	@RequestMapping(value = "/editSaveShipping", method = RequestMethod.POST)
	public ModelAndView editSaveShipping(@ModelAttribute Shipping shipping) {
		int x = dao.edit(shipping);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllShipping");
	}
	
}
