package com.tendu.test;

import com.tendu.mapper.SchoolMapper;
import com.tendu.mapper.UserMapper;
import com.tendu.model.School;
import com.tendu.model.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.List;

public class Test {

    public static void main(String[] args) {
        // 获取配置文件
        InputStream is = Test.class.getClassLoader().getResourceAsStream("mybatis-config.xml");
        // 创建数据库会话工厂
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);

        // 创建数据库会话对象
        SqlSession session = factory.openSession();

        // 创建数据库访问对象
//        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);
        UserMapper userMapper = session.getMapper(UserMapper.class);

        // 调用目标方法, 访问数据库
        List<User> list = userMapper.queryAll();
//        List<SchoolMapper> list = schoolMapper.querySchoolName("admin");
//        List<School> list = schoolMapper.querySchoolName("四川职业技术学院");
        System.out.println(list);
    }
}
