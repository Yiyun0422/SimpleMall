package com.simplemall.service;

import com.simplemall.pojo.PageBean;

public interface RecordService {
    PageBean recordListPage(Integer page, Integer pageSize, String uId, Integer finish);
}
