package com.xbj.test;

import com.xbj.domain.Monkey;
import com.xbj.mapper.MonkeyMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class MonkeyTest {
    MonkeyMapper mapper = null;
    {
        //获取sqlsessionFactory对象
        String resource = "mybatis-config.xml";
        try {
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            //获取SqlSession,openSession()方法有个布尔类型的参数,true:自动提交，false（默认）：不自动提交
            SqlSession sqlSession = sqlSessionFactory.openSession(true);
            //我们的目的是获取到UserMapper接口对应的实现类对象
            mapper= sqlSession.getMapper(MonkeyMapper.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void test1(){
        Monkey monkey = new Monkey();
        monkey.setMonkeyName(null);
        monkey.setAddress(null);
        List<Monkey> monkeys = mapper.listAll(monkey);
        System.out.println(monkeys);
    }
}
