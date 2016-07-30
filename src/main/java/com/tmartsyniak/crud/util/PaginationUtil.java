package com.tmartsyniak.crud.util;

import com.tmartsyniak.crud.entity.User;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public class PaginationUtil {

    public ModelAndView createModelAndViewWithPagination(List<User> allUsers, Integer page){
        ModelAndView modelAndView = new ModelAndView("index");
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(allUsers);
        pagedListHolder.setPageSize(5);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
        }
        modelAndView.addObject("page", page);
        if (page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("userList", pagedListHolder.getPageList());
        }
        else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("userList", pagedListHolder.getPageList());
        }
        return modelAndView;
    }
}
