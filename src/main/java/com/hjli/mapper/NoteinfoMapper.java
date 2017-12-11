package com.hjli.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hjli.model.NoteinfoWithBLOBs;
import com.hjli.model.Noteinfo;

public interface NoteinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Noteinfo record);

    int insertSelective(Noteinfo record);

    Noteinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Noteinfo record);

    int updateByPrimaryKey(Noteinfo record);
    
    List<NoteinfoWithBLOBs> findTwenty(String userid);
    
    List<NoteinfoWithBLOBs> findByTypeId(@Param("typeid")String typeId);
}