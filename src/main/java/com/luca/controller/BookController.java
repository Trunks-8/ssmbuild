package com.luca.controller;

import com.luca.pojo.Books;
import com.luca.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Luca
 * @Description 1:59
 */
@Controller
@RequestMapping("/book")
public class BookController {

    //controller 调 service 层
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    //1. 查询全部的书籍，并且返回一个书籍展示页面
    @RequestMapping("/allBook")
    public String list(Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "allBook";
    }

    //2. 跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddPaper() {
        return "addBook";
    }

    //添加书籍的请求
    @RequestMapping("/addBook")
    public String addPaper(Books books) {
        System.out.println(books);
        bookService.addBook(books);
        //重定向到@RequestMapping("/allBook")请求
        return "redirect:/book/allBook";
    }

    //3. 跳转到修改书籍页面
    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(Model model, int id) {
        Books books = bookService.queryBookById(id);
        System.out.println(books);
        model.addAttribute("book",books);
        return "updateBook";
    }

    @RequestMapping("/updateBook")
    public String updateBook(Model model, Books book) {
        System.out.println(book);
        bookService.updateBook(book);
        Books books = bookService.queryBookById(book.getBookID());
        model.addAttribute("books", books);
        return "redirect:/book/allBook";
    }

    //4. 跳转到书籍删除页面
    @RequestMapping("/delete/{bookID}")
    public String deleteBook(@PathVariable("bookID") int id) {
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    //5. 查询书籍
    @RequestMapping("/queryBook")
    public String queryBook(Model model, String queryBookName) {
        //首先得有个业务
        Books books = bookService.queryBookByName(queryBookName);
        System.err.println("books---" + books);
        List<Books> list = new ArrayList<Books>();
        list.add(books);
        if (books == null) {
            list = bookService.queryAllBook();
            model.addAttribute("error", "未查到该书籍");
        }
        model.addAttribute("list", list);
        return "allBook";
    }

}
