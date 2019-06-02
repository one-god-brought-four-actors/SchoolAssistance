package com.tendu.mapper;

import com.tendu.model.Work;

import java.util.List;

public interface WorkMapper {
    List<Work> queryAllWork();

    List<Work> queryWorkById(Integer id);



    Integer updateWork(Work work);

    Integer insertWork(Work work);

    Integer deleteWorkById(Integer id);
}
