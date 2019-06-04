package com.tendu.mapper;

import com.tendu.model.Page;
import com.tendu.model.Policy;

import java.util.List;

public interface PolicyMapper {

    List<Policy> queryAll();

    List<Policy> queryById(Integer id);

    Integer insert(Policy policy);

    String queryFilePathByPolicyId(Integer id);

    Integer deleteById(Integer id);

    Integer queryCountPolicy();

    List<Policy> queryByPage(Page page);
}
