package com.hjli.mapper;

import java.util.List;

import com.hjli.model.Noteinfo;

public interface NoteinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Noteinfo record);

    int insertSelective(Noteinfo record);

    Noteinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Noteinfo record);

    int updateByPrimaryKey(Noteinfo record);
    
    List<Noteinfo> findTwenty(String userid);
}