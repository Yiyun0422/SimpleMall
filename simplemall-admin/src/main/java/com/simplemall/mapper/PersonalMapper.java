package com.simplemall.mapper;

import com.simplemall.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface PersonalMapper {

    @Select("SELECT * FROM user WHERE u_id = #{userId}")
    User selectById(String userId);

    @Update("UPDATE user SET u_name = #{uName}, u_password = #{uPassword}, u_email = #{uEmail}, u_role = #{uRole} WHERE u_id = #{uId}")
    void updateUser(User user);
}
