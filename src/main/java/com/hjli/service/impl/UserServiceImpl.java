package com.hjli.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hjli.mapper.UserinfoMapper;
import com.hjli.model.Userinfo;

@Service("userService")
public class UserServiceImpl implements UserinfoMapper{

	@Resource
	UserinfoMapper userInfoMapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Userinfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(Userinfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.insertSelective(record);
	}

	@Override
	public Userinfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Userinfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Userinfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public Userinfo findByAccount(String uname) {
		// TODO Auto-generated method stub
		return userInfoMapper.findByAccount(uname);
	}

}
