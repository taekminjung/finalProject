package com.example.haribo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.haribo.service.ContactService;
import com.example.haribo.vo.Contact;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ContactController {
	@Autowired ContactService contactService;

	@GetMapping("/contact")
	public String contact(Contact contact) {
		return "public/contact";
	}
	
	
	@PostMapping("/contact")
	public String insertContact(Contact paramContact) {
		log.debug("\u001B[42m"+paramContact);
		//서비스 호출
		int insertContact = contactService.insertContact(paramContact);
		
		return "public/contact";
	}
}
