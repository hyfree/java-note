package com.hjli.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hjli.mapper.TypeinfoMapper;
import com.hjli.model.Typeinfo;

@Service("typeService")
public class TypeServiceImpl implements TypeinfoMapper {

	@Resource
	TypeinfoMapper typeInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return typeInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Typeinfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(Typeinfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.insertSelective(record);
	}

	@Override
	public Typeinfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return typeInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Typeinfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Typeinfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Typeinfo> findByUserId(String userid) {
		// TODO Auto-generated method stub
		return typeInfoMapper.findByUserId(userid);
	}

	@Override
	public int findMaxId() {
		// TODO Auto-generated method stub
		return typeInfoMapper.findMaxId();
	}

}
