package com.tmartsyniak.crud.service;

import com.tmartsyniak.crud.entity.User;

import java.util.List;

public interface UserService {
    long createUser(User user);

    User updateUser(User user);

    void deleteUser(long id);

    List<User> getAllUsers();

    User getUser(long id);

    List<User> getAllUsers(String userName);
}
