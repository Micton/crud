package com.tmartsyniak.crud.controller;

import com.tmartsyniak.crud.entity.User;
import com.tmartsyniak.crud.service.UserService;
import com.tmartsyniak.crud.util.PaginationUtil;
import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {

    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("createUser")
    public ModelAndView createUser(@ModelAttribute User user) {
        logger.info("Creating User. Data: " + user);
        return new ModelAndView("userForm");
    }

    @RequestMapping("editUser")
    public ModelAndView editUser(@RequestParam long id, @ModelAttribute User user) {
        logger.info("Updating the User for the Id " + id);
        user = userService.getUser(id);
        return new ModelAndView("userForm", "userObject", user);
    }

    @RequestMapping("saveUser")
    public ModelAndView saveUser(@ModelAttribute User user) {
        logger.info("Saving the User. Data : " + user);
        if (user.getId() == 0) {
            userService.createUser(user);
        } else {
            userService.updateUser(user);
        }
        return new ModelAndView("redirect:getAllUsers");
    }

    @RequestMapping("deleteUser")
    public ModelAndView deleteUser(@RequestParam long id) {
        logger.info("Deleting the User. Id : " + id);
        userService.deleteUser(id);
        return new ModelAndView("redirect:getAllUsers");
    }

    @RequestMapping(value = {"getAllUsers", "/"})
    public ModelAndView getAllUsers(@RequestParam(required = false) Integer page) {
        logger.info("Getting the all Users.");
        List<User> allUsers = userService.getAllUsers();
        PaginationUtil paginationUtil = new PaginationUtil();
        return paginationUtil.createModelAndViewWithPagination(allUsers, page);
    }

    @RequestMapping("searchUser")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName, @RequestParam(required = false) Integer page) {
        logger.info("Searching the User. User Names: " + searchName);
        List<User> allUsers = userService.getAllUsers(searchName);
        PaginationUtil paginationUtil = new PaginationUtil();
        ModelAndView modelAndView = paginationUtil.createModelAndViewWithPagination(allUsers, page);
        modelAndView.addObject("searchName", searchName);
        return modelAndView;
    }
}