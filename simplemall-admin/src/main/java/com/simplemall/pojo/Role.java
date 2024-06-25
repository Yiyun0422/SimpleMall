package com.simplemall.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {
    private Integer roleId;
    private String rName;
    private String rDesc;
    private LocalDateTime rCreateTime;
    private LocalDateTime rUpdateTime;
}
