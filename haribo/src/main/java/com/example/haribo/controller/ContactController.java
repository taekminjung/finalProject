package com.example.haribo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.haribo.service.BranchService;
import com.example.haribo.service.ContactService;
import com.example.haribo.vo.Branch;
import com.example.haribo.vo.Contact;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ContactController {
	@Autowired ContactService contactService;
	@Autowired BranchService branchService;
	
	@GetMapping("/contact")
	public String contact(Model model, Contact contact) {
		List<Branch> list = branchService.branchList();
		
		model.addAttribute("list", list);
		return "public/contact";
	}
	@PostMapping("/contact")
	public String insertContact(Contact paramContact) {
		System.out.println("\u001B[42m"+paramContact);
		//서비스 호출
		int insertContact = contactService.insertContact(paramContact);
		
		return "redirect:/home";
	}
	
	@GetMapping("/contactCustomer")
	public String contactCustomer(Model model, @RequestParam(defaultValue="1")int currentPage) {
		List<Contact> list = contactService.contactCustomerList(currentPage);
		int lastPage = contactService.lastPage();
		
		model.addAttribute("list", list);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		return "emp/contactCustomer";
	}
}
