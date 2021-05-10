package com.sl.springboot.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sl.springboot.models.Book;
import com.sl.springboot.services.BookService;

@Controller
public class BookController {

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
	public String init(@RequestParam Integer id, HttpServletRequest req) {
		req.setAttribute("book", bookService.findOne(id).get());
		req.setAttribute("mode", "BOOK_EDIT");
		return "book-home";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), false));
	}
	
	@PostMapping("/saveBook")
	public void save(@ModelAttribute Book book, HttpServletRequest req, HttpServletResponse resp) {
		bookService.save(book);
		req.setAttribute("books", bookService.findAll());
		req.setAttribute("mode", "BOOK_VIEW");
		//return "book-home";
		try {
			resp.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping("/newBook")
	public String newBook(HttpServletRequest req) {
		req.setAttribute("mode", "BOOK_NEW");
		return "book-home";
	}
	
	@GetMapping("/deleteBook")
	public String deleteBook(@RequestParam Integer id, HttpServletRequest req) {
		bookService.delete(id);
		req.setAttribute("books", bookService.findAll());
		req.setAttribute("mode", "BOOK_VIEW");
		return "book-home";
	}
	
}
