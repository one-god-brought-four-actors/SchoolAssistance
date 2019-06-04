package com.tendu.mapper;

import com.tendu.model.Need;
import com.tendu.model.Page;

import java.util.List;

public interface NeedMapper {
    List<Need> queryAll();

    List<Need> queryById(Integer id);

    int deleteNeedById(Integer id);

    int insert(Need need);

    int update(Need need);

    List<Need> queryByPage(Page page);

    Integer getCountNeed();


}
