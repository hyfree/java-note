package com.hjli.mapper;

import java.util.List;

import com.hjli.model.Typeinfo;

public interface TypeinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Typeinfo record);

    int insertSelective(Typeinfo record);

    Typeinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Typeinfo record);

    int updateByPrimaryKey(Typeinfo record);
    
    /**
     * 根据用户id查询
     * 
     * */
    List<Typeinfo> findByUserId(String userid);
    
    int findMaxId();
}