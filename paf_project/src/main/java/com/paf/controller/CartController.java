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

import com.paf.dao.CartDao;
import com.paf.dao.CartItemsDao;
import com.paf.dao.PaymentDao;
import com.paf.dao.ShippingDao;
import com.paf.model.Cart;
import com.paf.model.CartItems;
import com.paf.model.CusOrder;
import com.paf.model.Customer;
import com.paf.model.Payment;
import com.paf.model.Shipping;

@Controller
public class CartController {

	@Autowired
	public CartDao dao;

	@Autowired
	public CartItemsDao dao1;

	@Autowired
	public ShippingDao dao2;

	@Autowired
	public PaymentDao dao3;

	@RequestMapping(value = "/viewAllCart")
	public ModelAndView viewAllCart(ModelAndView model, HttpSession session) {

		if (session.getAttribute("userID") == null) {
			return new ModelAndView("login");
		}

		else {
			int cusID = Integer.valueOf(session.getAttribute("userID").toString());
			List<Cart> listCart = dao.getAllCart(cusID);
			model.addObject("listCart", listCart);
			model.setViewName("shoppingCart");

			return model;
		}

	}

	@RequestMapping(value = "/editSaveCartItems", method = RequestMethod.POST)
	public ModelAndView editSaveCustomer(@ModelAttribute CartItems cartItems, HttpServletRequest request) {
		int itemID = Integer.valueOf(request.getParameter("itemID"));
		System.out.println("Item ID : " + itemID);
		int x = dao1.editCart(cartItems, itemID);

		if (x == 1) {
			JOptionPane.showMessageDialog(null, "Item updated Successfully", "Successfull",
					JOptionPane.INFORMATION_MESSAGE);
		}

		else {
			JOptionPane.showMessageDialog(null, "Item not updated Successfully!", "Error", JOptionPane.ERROR_MESSAGE);
		}

		System.out.println(x);
		return new ModelAndView("redirect:/viewAllCartItems");
	}

	@RequestMapping(value = "/viewAllCartItems")
	public ModelAndView viewAllCartItems(ModelAndView model, HttpSession session) {

		if (session.getAttribute("userID") == null) {
			return new ModelAndView("login");
		}

		else {
			int cusID = Integer.valueOf(session.getAttribute("userID").toString());
			CartItems cartItems = new CartItems();
			CusOrder cusOrder = new CusOrder();

			List<CartItems> listCartItems = dao1.getAllCart(cusID);
			if (listCartItems.isEmpty()) {
				JOptionPane.showMessageDialog(null,
						"Nothing to show in your Cart! You will be redirected to your Homepage Now!", "Warning",
						JOptionPane.WARNING_MESSAGE);
				return new ModelAndView("redirect:/home");
			}

			else {
				List<Shipping> listShipping = dao2.getAllShipping();
				List<Payment> listPayment = dao3.getAllPayment();

				model.addObject("listCartItems", listCartItems);
				model.addObject("cartItems", cartItems);
				model.addObject("cusOrder", cusOrder);
				model.addObject("listShipping", listShipping);
				model.addObject("listPayment", listPayment);
				model.setViewName("shoppingCart");

				return model;
			}

		}

	}

	@RequestMapping(value = "/deleteCartItems")
	public ModelAndView deleteCartItems(ModelAndView model, HttpServletRequest request) {

		int itemID = Integer.valueOf(request.getParameter("itemID"));
		if (dao1.removeCartItem(itemID) == 1) {
			JOptionPane.showMessageDialog(null, "Item deleted from the Cart Successfully", "Successful",
					JOptionPane.INFORMATION_MESSAGE);
			return new ModelAndView("redirect:/viewAllCartItems");
		}

		else {
			JOptionPane.showMessageDialog(null, "Item didn't delete from the Cart Successfully", "Unsuccessfull",
					JOptionPane.ERROR_MESSAGE);
			return new ModelAndView("redirect:/viewAllCartItems");
		}

	}

	@RequestMapping(value = "/addToCart", method = RequestMethod.GET)
	public ModelAndView addToCart(ModelAndView model, HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("userID") == null) {
			return new ModelAndView("login");
		}

		else {
			int prodID = Integer.valueOf(request.getParameter("prodID"));
			int cusID = Integer.valueOf(session.getAttribute("userID").toString());

			int cartCount = dao.searchCount(cusID);

			if (cartCount >= 1) {
				int cartID = dao.getCartID(cusID);
				int duplicateProduct = dao1.getCurrentAddedCount(cartID, prodID);

				if (duplicateProduct >= 1) {
					JOptionPane.showMessageDialog(null, "Item already added to the Cart", "Unsuccessfull",
							JOptionPane.ERROR_MESSAGE);
					return new ModelAndView("redirect:/home");
				}

				else {
					dao1.addProduct(cartID, prodID);
					JOptionPane.showMessageDialog(null, "Item successfully added to the Cart", "Successfull",
							JOptionPane.INFORMATION_MESSAGE);
					return new ModelAndView("redirect:/home");
				}
			}

			else {
				dao.add(cusID);

				int cartID = dao.getCartID(cusID);
				int duplicateProduct = dao1.getCurrentAddedCount(cartID, prodID);

				if (duplicateProduct >= 1) {
					JOptionPane.showMessageDialog(null, "Item already added to the Cart", "Unsuccessfull",
							JOptionPane.ERROR_MESSAGE);
					return new ModelAndView("redirect:/home");
				}

				else {
					dao1.addProduct(cartID, prodID);
					JOptionPane.showMessageDialog(null, "Item successfully added to the Cart", "Successfull",
							JOptionPane.INFORMATION_MESSAGE);
					return new ModelAndView("redirect:/home");
				}

			}

		}

	}

}
