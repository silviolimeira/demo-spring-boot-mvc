package com.sl.springboot.dao;

import java.util.Collection;

import org.springframework.data.repository.CrudRepository;

import com.sl.springboot.models.Book;

public interface Repository extends CrudRepository<Book, Integer>{


	
}
