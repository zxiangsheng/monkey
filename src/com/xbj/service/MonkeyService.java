package com.xbj.service;

import com.xbj.domain.Monkey;

import java.util.List;
/**
  * 描述 :monkey service 层处理
  * ZXS nothing can defeat me
  * 2019/9/10 18:58
*/
public interface MonkeyService {
    /**
     * 登录验证
     */
    Monkey loginCkeck(String name,String password);
    /**
     * 姓名验重
     */
    boolean checkName(String name);
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
