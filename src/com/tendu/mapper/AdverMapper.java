package com.tendu.mapper;

import com.tendu.model.Adver;

import java.util.List;

public interface AdverMapper {
    List<Adver> queryAllAdver();
<<<<<<< HEAD

    Integer insertAdver(Adver adver);

    List<Adver> selectAdverById(Integer id);

    int updateAdver(Adver adver);

    int DelAdver(int id);

    int updateReadNum(Adver adver);
=======
>>>>>>> 809ed5f5a14a73e7b8d4271f46152c50335dd788
}
