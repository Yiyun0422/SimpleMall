package com.simplemall.mapper;

import com.simplemall.pojo.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ProductMapper {

    @Select("select * from product")
    List<Product> productListPage();
    List<Product> productListSearch();

    @Insert("insert into product (p_img, p_name, p_price,p_brand,p_number, p_category) " +
            "values (#{pImg},#{pName},#{pPrice},#{pBrand},#{pNumber},#{pCategory})")
    void insert(Product product);

    @Delete("delete from product where product_id = #{id}")
    void delete(Integer id);

    @Select("select * from product where product_id = #{id}")
    Product selectById(Integer id);

    void update(Product product);


}
