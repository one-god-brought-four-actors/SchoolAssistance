package com.tendu.mapper;

import com.tendu.model.Page;
import com.tendu.model.User;
import com.tendu.model.Work;

import java.util.List;

public interface WorkMapper {


    List<Work> queryWorkById(Integer id);

    Integer getCountWork();

    List<Work> queryByPage(Page page);

    Integer updateWork(Work work);

    Integer insertWork(Work work);

    Integer deleteWorkById(Integer id);

}
