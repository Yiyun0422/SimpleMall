package com.simplemall.service;

import com.simplemall.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> categoryList();

    void delete(Integer id);

    void insert(Category category);

    Category selectById(Integer id);

    void update(Category category);
}
