package com.hjli.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hjli.mapper.NoteinfoMapper;
import com.hjli.model.NoteinfoWithBLOBs;
import com.hjli.model.Noteinfo;

@Service("noteService")
public class NoteServiceImpl implements NoteinfoMapper {

	@Resource
	NoteinfoMapper noteInfoMapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Noteinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Noteinfo record) {
		// TODO Auto-generated method stub
		return noteInfoMapper.insertSelective(record);
	}

	@Override
	public Noteinfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Noteinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Noteinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoteinfoWithBLOBs> findTwenty(String userid) {
		// TODO Auto-generated method stub
		return noteInfoMapper.findTwenty(userid);
	}

	/* (non-Javadoc)
	 * @see com.hjli.mapper.NoteinfoMapper#findByTypeId(java.lang.String)
	 */
	@Override
	public List<NoteinfoWithBLOBs> findByTypeId(String typeId) {
		// TODO Auto-generated method stub
		return noteInfoMapper.findByTypeId(typeId);
	}

}
