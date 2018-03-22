package com.hjli.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hjli.model.NoteinfoWithBLOBs;
import com.hjli.mapper.NoteinfoMapper;
import com.hjli.model.Noteinfo;

@Service("noteService")
public class NoteServiceImpl implements NoteinfoMapper {

	@Resource
	NoteinfoMapper noteInfoMapper;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return noteInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(Noteinfo record) {
		// TODO Auto-generated method stub
		return noteInfoMapper.insert(record);
	}

	public int insertSelective(Noteinfo record) {
		// TODO Auto-generated method stub
		return noteInfoMapper.insertSelective(record);
	}

	public Noteinfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return noteInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Noteinfo record) {
		// TODO Auto-generated method stub
		return noteInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Noteinfo record) {
		// TODO Auto-generated method stub
		return noteInfoMapper.updateByPrimaryKey(record);
	}

	public List<NoteinfoWithBLOBs> findTwenty(String userid) {
		// TODO Auto-generated method stub
		return noteInfoMapper.findTwenty(userid);
	}

	public List<NoteinfoWithBLOBs> findByTypeId(String typeId) {
		// TODO Auto-generated method stub
		return noteInfoMapper.findByTypeId(typeId);
	}
	

}
