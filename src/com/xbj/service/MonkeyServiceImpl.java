package com.xbj.service;

import com.xbj.domain.Monkey;
import com.xbj.mapper.MonkeyMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
@Service
public class MonkeyServiceImpl implements MonkeyService {
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
            //System.out.println(mapper);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Monkey loginCkeck(String name,String password) {
        Monkey monkey = mapper.loginCkeck(name, password);
        if(monkey == null){
            System.out.println("未查询到该用户！！！");
            return null;
        }
        return monkey;
    }

    @Override
    public boolean checkName(String name) {
        return mapper.checkName(name) == 1;
    }

    @Override
    public void insertMonkey(Monkey monkey) {
        mapper.insertMonkey(monkey);
    }

    @Override
    public void deleteMonkey(int id) {
        mapper.deleteMonkey(id);
    }

    @Override
    public void modifyMonkey(Monkey monkey) {
        mapper.modifyMonkey(monkey);
    }

    @Override
    public Monkey findById(int id) {
        return mapper.findById(id);
    }

    @Override
    public List<Monkey> listAll(Monkey monkey) {
        List<Monkey> monkeys = mapper.listAll(monkey);
        //System.out.println(monkeys+"333");
        return monkeys;
    }
}
