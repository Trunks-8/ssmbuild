package com.luca.dao;

import com.luca.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Luca
 * @Description 1:02
 */
public interface BookMapper {

    //增加一个Book
    int addBook(Books book);

    //根据id删除一个Book
    int deleteBookById(@Param("bookID") int id);

    //更新Book
    int updateBook(Books books);

    //根据id查询,返回一个Book
    Books queryBookById(@Param("bookID") int id);

    //查询全部Book,返回list集合
    List<Books> queryAllBook();

    //查询书籍,根据书籍名称
    Books queryBookByName(@Param("bookName") String bookName);

}
