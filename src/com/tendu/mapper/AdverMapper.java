package com.tendu.mapper;

import com.tendu.model.Adver;
import com.tendu.model.Page;

import java.util.List;

public interface AdverMapper {
    List<Adver> queryAllAdver();

    Integer insertAdver(Adver adver);

    List<Adver> selectAdverById(Integer id);

    int updateAdver(Adver adver);

    int DelAdver(int id);

    Integer getCountAdver();

    List<Adver> queryByPage(Page page);
}
