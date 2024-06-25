package com.simplemall.controller;

import com.simplemall.pojo.Category;
import com.simplemall.pojo.Result;
import com.simplemall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    /**
     * 查询所有类别
     */
    @GetMapping("/categories")
    public Result categoryList() {
        List<Category> categories = categoryService.categoryList();
        return Result.success(categories);
    }

    /**
     * 删除分类
     */
    @DeleteMapping("/category/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        categoryService.delete(id);
        return Result.success();
    }

    /**
     * 添加分类
     */
    @PostMapping("/category/insert")
    public Result insert(@RequestBody Category category) {

        categoryService.insert(category);
        return Result.success();
    }


    /**
     * 通过ID查询兵更新分类
     */
    @GetMapping("/category/select/{id}")
    public Result selectById(@PathVariable Integer id) {
        Category category = categoryService.selectById(id);
        return Result.success(category);
    }
    @PutMapping("/category/update")
    public Result update(@RequestBody Category category) {
        categoryService.update(category);
        return Result.success();
    }
}
