package com.paf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.paf.dao.AdminDao;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDao dao;

	@RequestMapping(value = "/adminDashboard")
	public ModelAndView adminDashboardView() {
		return new ModelAndView("adminDashboard");
	}
	
	
	
}
