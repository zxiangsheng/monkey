package com.xbj.mapper;

import com.xbj.domain.Monkey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
  * 描述 :monkey的增删改查
  * ZXS nothing can defeat me
  * 2019/9/10 17:47
*/
public interface MonkeyMapper {
    /**
     * 登录验证
     */
    Monkey loginCkeck(@Param("name") String name, @Param("password") String password);
    /**
     * 姓名验重
     */
    int checkName(String name);
    /**
     * 增
     */
    void insertMonkey(Monkey monkey);

    /**
     * 根据id删除
     */
    void deleteMonkey(int id);

    /**
     * 改
     */
    void modifyMonkey(Monkey monkey);

    /**
     * 根据id查询对象
     */
    Monkey findById(int id);

    /**
     * 根据姓名，地址模糊查询
     */
    List<Monkey> listAll(Monkey monkey);
}
