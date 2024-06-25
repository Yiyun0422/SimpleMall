package com.simplemall.service;

import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.Product;

import java.math.BigDecimal;
import java.util.List;

public interface ProductService {
    PageBean productListPage(Integer page, Integer pageSize);
    PageBean productListSearch(Integer page, Integer pageSize, String pName, Integer pCategory, BigDecimal minPrice, BigDecimal maxPrice);

    void insert(Product product);

    void delete(Integer id);

    Product selectById(Integer id);

    void update(Product product);

}
