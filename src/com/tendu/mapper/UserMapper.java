package com.tendu.mapper;
import com.tendu.model.User;

import java.util.List;

public interface UserMapper {

    List<User> queryUserName(String username);
    List<User> queryUserById(Integer id);

    List<User> queryAll();

    Integer deleteUser(Integer id);

    Integer insertUser(User user);

    Integer updateUser(User user);
}
