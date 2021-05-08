package com.sl.springboot.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sl.springboot.models.Book;
import com.sl.springboot.services.BookService;

@Controller
public class IndexController {

	@Autowired
	private BookService bookService;
	
	@GetMapping("/HelloJsp")
	public String init() {
		return "index";
	}
	
	@GetMapping("/")
	public String init(HttpServletRequest req) {
		req.setAttribute("books", bookService.findAll());
		req.setAttribute("mode", "BOOK_VIEW");
		return "book-home";
	}
	
	@GetMapping("/updateBook")
	public String init(@RequestParam long id, HttpServletRequest req) {
		req.setAttribute("book", bookService.findOne(id).get());
		req.setAttribute("mode", "BOOK_EDIT");
		return "book-home";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyy-mm-dd"), false));
	}
	
	@PostMapping("/saveBook")
	public String init(@ModelAttribute Book book, HttpServletRequest req) {
		bookService.save(book);
		req.setAttribute("books", bookService.findAll());
		req.setAttribute("mode", "BOOK_VIEW");
		return "book-home";
	}		
}
