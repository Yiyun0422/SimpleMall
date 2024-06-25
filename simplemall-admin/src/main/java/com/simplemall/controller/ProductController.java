package com.simplemall.controller;

import com.simplemall.pojo.Product;
import com.simplemall.pojo.Result;
import com.simplemall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.simplemall.pojo.PageBean;

import java.math.BigDecimal;

@RestController
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * 分页查询所有数据
     */
    @GetMapping("/products")
    public Result productListPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "7") Integer pageSize) {
        PageBean pageBean=productService.productListPage(page,pageSize);
        return Result.success(pageBean);
    }
    // 条件查询
    @GetMapping("/products/search")
    public Result productListSearch(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "7") Integer pageSize,
            @RequestParam(required = false) String pName,
            @RequestParam(required = false) Integer pCategory,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice) {

        PageBean pageBean = productService.productListSearch(page, pageSize, pName, pCategory, minPrice, maxPrice);
        return Result.success(pageBean);
    }


    /**
     * 新增商品数据
     */
    @PostMapping("/product/insert")
    public Result insert(@RequestBody Product product){
        productService.insert(product);
        return Result.success();
    }

    /**
     * 删除商品数据
     */
    @DeleteMapping("/product/delete/{id}")
    public Result delete(@PathVariable Integer id){
        productService.delete(id);
        return Result.success();
    }

    /**
     * 修改商品数据
     */
    @GetMapping("/product/select/{id}")
    public Result selectById(@PathVariable Integer id){
        Product product = productService.selectById(id);
        return Result.success(product);
    }
    @PutMapping("/product/update")
    public Result update(@RequestBody Product product){
        productService.update(product);
        return Result.success();
    }

}
