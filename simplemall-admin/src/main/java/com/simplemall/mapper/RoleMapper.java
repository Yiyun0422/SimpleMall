package com.simplemall.mapper;

import com.simplemall.pojo.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface RoleMapper {

    @Select("select * from role")
    List<Role> roleList();

    @Delete("delete from role where role_id = #{id}")
    void delete(Integer id);

    @Insert("insert into role (r_name, r_desc , r_create_time , r_update_time) VALUES (#{rName},#{rDesc},#{rCreateTime},#{rUpdateTime})")
    void insert(Role role);

    @Select("select * from role where role_id = #{id}")
    Role selectById(Integer id);


    void update(Role role);
}
