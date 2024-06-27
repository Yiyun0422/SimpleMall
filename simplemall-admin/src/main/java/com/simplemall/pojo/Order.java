package com.simplemall.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private Integer orderId;
    private Integer userId;
    private Integer productId;
    private String pName;
    private String uId;
    private LocalDateTime orderTime;
    private LocalDateTime operateTime;
    private Integer finish;
    private Integer status;
}
