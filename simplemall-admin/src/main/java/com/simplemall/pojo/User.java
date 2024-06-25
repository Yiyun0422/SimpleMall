package com.simplemall.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer userId;
    private String uId;
    private String uPassword;
    private String uName;
    private String uImg;
    private String uEmail;
    private LocalDateTime uCreateTime;
    private LocalDateTime uUpdateTime;
    private Integer uRole;
}
