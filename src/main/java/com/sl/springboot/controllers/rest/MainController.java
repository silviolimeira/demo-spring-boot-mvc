package com.sl.springboot.controllers.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sl.springboot.dao.Repository;
import com.sl.springboot.models.Book;
import com.sl.springboot.services.BookService;

@RestController
public class MainController {

	@Autowired
	private BookService bookService;
	
	@GetMapping(value = "/hello")
	public String hello() {
		
		return "Hello World Spring Rest Controller!";
		
	}
	
	@GetMapping("/books")
	@Produces("application/json")
	@Consumes("application/json")
	public Iterable<Book> getAllBooks() {
		return bookService.findAll();
	}
	
	@GetMapping("/delete")
	public void deleteBook(@RequestParam long id) {
		bookService.delete(id);
	}
	
}
