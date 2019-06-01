package com.tendu.mapper;

import com.tendu.model.Need;

import java.util.List;

public interface NeedMapper {
    List<Need> queryAll();
//    List<Need> querySchoolName(String schoolName);
//
    List<Need> queryById(Integer id);

    int deleteNeedById(Integer id);


//    Integer deleteSchoolById(Integer id);
    int insert(Need need);
//
//    Integer updateSchool(Need need);
}
