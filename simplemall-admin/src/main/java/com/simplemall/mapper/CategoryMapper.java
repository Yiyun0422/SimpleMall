package com.simplemall.mapper;

import com.simplemall.pojo.Category;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CategoryMapper {

    // 返回所有类别的列表
    @Select("SELECT * FROM category")
    List<Category> categoryList();

    // 统计某个类别中的产品数量
    @Select("SELECT COUNT(*) FROM product WHERE p_category = #{categoryId}")
    int countProductsInCategory(@Param("categoryId") int categoryId);

    @Delete("DELETE FROM category WHERE category_id = #{id}")
    void delete(@Param("id") Integer id);

    @Insert("INSERT INTO category (c_name, c_number) VALUES (#{cName}, #{cNumber})")
    void insert(Category category);

    @Select("SELECT * FROM category WHERE category_id = #{id}")
    Category selectById(@Param("id") Integer id);

    @Update("UPDATE category SET c_name = #{cName}, c_number = #{cNumber} WHERE category_id = #{categoryId}")
    void update(Category category);
}
