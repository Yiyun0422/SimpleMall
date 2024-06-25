package com.simplemall.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private Integer productId;
    private String pImg;
    private String pName;
    private String pBrand;
    private BigDecimal pPrice;
    private String pNumber;
    private Integer pCategory;
}
