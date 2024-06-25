package com.simplemall.mapper;

import com.simplemall.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface UserMapper {

    List<User> userListPage();

    @Delete("delete from user where user_id = #{id}")
    void delete(Integer id);


    @Insert("insert into user (u_id, u_password, u_name, u_img, u_email, u_create_time, u_update_time, u_role) " +
            "values (#{uId},#{uPassword},#{uName},#{uImg},#{uEmail},#{uCreateTime},#{uUpdateTime},#{uRole})")
    void insert(User user);

    @Select("select * from user where user_id = #{id}")
    User selectById(Integer id);

    void update(User user);

}
