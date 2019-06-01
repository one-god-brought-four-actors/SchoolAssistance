package com.tendu.utils;

import com.tendu.test.Test;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class DBTools {

    public static SqlSession getSession() {
        // 获取配置文件
        InputStream is = Test.class.getClassLoader().getResourceAsStream("mybatis-config.xml");
        // 创建数据库会话工厂
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);

        // 创建数据库会话对象
        SqlSession session = factory.openSession();

        try {
            is.close();
        }catch (IOException e){
            e.printStackTrace();
        }
        return session;
    }
}
