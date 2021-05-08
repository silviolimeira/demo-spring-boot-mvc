package com.sl.springboot.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sl.springboot.dao.Repository;
import com.sl.springboot.models.Book;

@Service
public class BookService {

	@Autowired
	private Repository repository;
	
	public Collection<Book> findAll() {
		
		List<Book> books = new ArrayList<Book>();

		for (Book book : repository.findAll()) {
			books.add(book);
		}
		
		return books;
	}
	
	public void delete(long id) {
		repository.deleteById(id);
	}
	
	public Optional<Book> findOne(long id) {
		return repository.findById(id);
	}
	
	public void save(Book book) {
		
		repository.save(book);
	}
	
}
