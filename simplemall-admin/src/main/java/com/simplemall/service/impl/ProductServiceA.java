package com.simplemall.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.simplemall.mapper.ProductMapper;
import com.simplemall.pojo.PageBean;
import com.simplemall.pojo.Product;
import com.simplemall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ProductServiceA implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    public PageBean productListPage(Integer page, Integer pageSize){
        PageHelper.startPage(page,pageSize);
        List<Product> products = productMapper.productListPage();
        Page<Product> p=(Page<Product>)products;
        //封装pageBean对象
        PageBean pageBean=new PageBean(p.getTotal(),p.getResult());
        return pageBean;
    }
    public PageBean productListSearch(Integer page, Integer pageSize, String pName, Integer pCategory, BigDecimal minPrice, BigDecimal maxPrice){
        PageHelper.startPage(page,pageSize);
        List<Product> products = productMapper.productListSearch(pName,pCategory,minPrice,maxPrice);
        Page<Product> p=(Page<Product>)products;
        //封装pageBean对象
        PageBean pageBean=new PageBean(p.getTotal(),p.getResult());
        return pageBean;
    }

    public void insert(Product product){
        productMapper.insert(product);
    }

    public void delete(Integer id){
        productMapper.delete(id);
    }

    public Product selectById(Integer id){
        return productMapper.selectById(id);
    }

    public void update(Product product){
        productMapper.update(product);
    }
}
