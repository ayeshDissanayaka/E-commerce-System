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

import com.paf.dao.CategoryDao;
import com.paf.model.Category;

@Controller
public class CategoryController {

	@Autowired
	public CategoryDao dao;

	@RequestMapping(value = "/viewAllCategory")
	public ModelAndView viewAllCategory(ModelAndView model) {
		List<Category> listCategory = dao.getAllCategory();
		model.addObject("listCategory", listCategory);
		model.setViewName("category");

		return model;
	}
	
	

	@RequestMapping(value = "/searchCategory")
	public ModelAndView searchCategory(HttpServletRequest request, ModelAndView model) {
		String val = request.getParameter("searchVal");
		List<Category> listCategory = dao.searchCategory(val);
		model.addObject("listCategory", listCategory);
		model.setViewName("category");

		return model;
	}

	@RequestMapping(value = "/deleteCategory", method = RequestMethod.GET)
	public ModelAndView deleteCustomer(HttpServletRequest request) {
		String comm = request.getParameter("command");
		int catID = Integer.parseInt(request.getParameter("catID"));
		dao.delete(catID, comm);

		if (comm.equals("active")) {
			JOptionPane.showMessageDialog(null, "Category Activated Sucessfully!", "Activation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		else if (comm.equals("inactive")) {
			JOptionPane.showMessageDialog(null, "Category Deactivated Sucessfully!", "Deactivation",
					JOptionPane.INFORMATION_MESSAGE);
		}

		return new ModelAndView("redirect:/viewAllCategory");

	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
	public ModelAndView Category(ModelAndView model) {
		Category category = new Category();
		model.addObject("category", category);
		model.setViewName("addCategory");
		return model;
	}

	@RequestMapping(value = "/saveCategory", method = RequestMethod.POST)
	public ModelAndView saveCategory(@ModelAttribute Category category) {
		int x = dao.add(category);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllCategory");
	}
	
	@RequestMapping(value = "/editCategory", method = RequestMethod.GET)
    public ModelAndView editCategory(HttpServletRequest request) {
        int categoryID = Integer.parseInt(request.getParameter("cID"));
        Category category = dao.getCategory(categoryID);
        ModelAndView model = new ModelAndView("editCategory");
        model.addObject("category", category);
 
        return model;
    }
	
	@RequestMapping(value = "/editSaveCategory", method = RequestMethod.POST)
	public ModelAndView editSaveCategory(@ModelAttribute Category category) {
		int x = dao.edit(category);
		System.out.println(x);
		return new ModelAndView("redirect:/viewAllCategory");
	}
	
}
