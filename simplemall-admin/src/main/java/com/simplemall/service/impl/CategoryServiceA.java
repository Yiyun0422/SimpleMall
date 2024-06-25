package com.simplemall.service.impl;

import com.simplemall.mapper.CategoryMapper;
import com.simplemall.pojo.Category;
import com.simplemall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceA implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    public List<Category> categoryList() {
        List<Category> categories = categoryMapper.categoryList();
        for (Category category : categories) {
            int productCount = categoryMapper.countProductsInCategory(category.getCategoryId());
            category.setCNumber(productCount);
        }
        return categories;
    }


    public void delete(Integer id) {
        categoryMapper.delete(id);
    }

    public void insert(Category category) {
        categoryMapper.insert(category);
    }

    public Category selectById(Integer id) {
        return categoryMapper.selectById(id);
    }

    public void update(Category category) {
        categoryMapper.update(category);
    }
}
