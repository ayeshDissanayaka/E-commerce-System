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

import com.paf.dao.PaymentDao;
import com.paf.model.Payment;



@Controller
public class PaymentController {

	@Autowired
	public PaymentDao dao;

	@RequestMapping(value = "/viewAllPayment")
	public ModelAndView viewAllPayment(ModelAndView model, HttpSession session) {
		if(session.getAttribute("emailAdmin") == null) {
			return new ModelAndView("redirect:/adminDashboard");
		}
		
		else {
			List<Payment> listPayment = dao.getAllPayment();
			model.addObject("listPayment", listPayment);
			model.setViewName("payment");

			return model;
		}
		
	}

	@RequestMapping(value = "/searchPayment")
	public ModelAndView searchPayment(HttpServletRequest request, ModelAndView model) {
		String val = request.getParameter("searchVal");
		List<Payment> listPayment = dao.searchPayment(val);
		model.addObject("listPayment", listPayment);
		model.setViewName("payment");

		return model;
	}

	@RequestMapping(value = "/deletePayment", method = RequestMethod.GET)
	public ModelAndView deletePayment(HttpServletRequest request) {
		String comm = request.getParameter("command");
		int payID = Integer.parseInt(request.getParameter("payID"));
		dao.delete(payID, comm);

		if (comm.equals("active")) {
			JOptionPane.showMessageDialog(null, "Payment Method Activated Sucessfully!", "Activation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		else if (comm.equals("inactive")) {
			JOptionPane.showMessageDialog(null, "Payment Method Deactivated Sucessfully!", "Deactivation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		return new ModelAndView("redirect:/viewAllPayment");

	}

	@RequestMapping(value = "/addPayment", method = RequestMethod.GET)
	public ModelAndView addPayment(ModelAndView model) {
		Payment payment = new Payment();
		model.addObject("payment", payment);
		model.setViewName("addPayment");
		return model;
	}

	@RequestMapping(value = "/savePayment", method = RequestMethod.POST)
	public ModelAndView savePayment(@ModelAttribute Payment payment) {
		int x = dao.add(payment);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllPayment");
	}
	
	@RequestMapping(value = "/editPayment", method = RequestMethod.GET)
    public ModelAndView editPayment(HttpServletRequest request) {
        int paymentID = Integer.parseInt(request.getParameter("pID"));
        Payment payment = dao.getPayment(paymentID);
        ModelAndView model = new ModelAndView("editPayment");
        model.addObject("payment", payment);
 
        return model;
    }
	
	@RequestMapping(value = "/editSavePayment", method = RequestMethod.POST)
	public ModelAndView editSavePayment(@ModelAttribute Payment payment) {
		int x = dao.edit(payment);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllPayment");
	}
	
}
