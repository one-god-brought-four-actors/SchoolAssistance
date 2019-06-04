package com.tendu.mapper;

import com.tendu.model.Policy;

import java.util.List;

public interface PolicyMapper {

    List<Policy> queryAll();

    Integer insert(Policy policy);

    String queryFilePathByPolicyId(Integer id);
}
