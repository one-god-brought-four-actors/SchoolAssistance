package com.tendu.mapper;

import com.tendu.model.School;

import java.util.List;

public interface SchoolMapper {

    List<School> querySchoolName(String schoolName);

    List<School> querySchoolNameById(Integer id);

    List<School> queryAllSchool();

    Integer deleteSchoolById(Integer id);

    Integer insertSchool(School school);

    Integer updateSchool(School school);
}
