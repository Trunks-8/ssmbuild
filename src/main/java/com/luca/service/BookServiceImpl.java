package com.luca.service;

import com.luca.dao.BookMapper;
import com.luca.pojo.Books;

import java.util.List;

/**
 * @author Luca
 * @Description 1:16
 */
public class BookServiceImpl implements BookService {

    //调用dao层的操作，设置一个set接口，方便Spring管理
    //service调用dao层，组合dao
    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    //增加一个Book
    public int addBook(Books book) {
        return bookMapper.addBook(book);
    }

    //根据id删除一个Book
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    //更新Book
    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    //根据id查询,返回一个Book
    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    //查询全部Book,返回list集合
    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    //查询书籍,根据书籍名称
    public Books queryBookByName(String bookName) {
        return bookMapper.queryBookByName(bookName);
    }

}
