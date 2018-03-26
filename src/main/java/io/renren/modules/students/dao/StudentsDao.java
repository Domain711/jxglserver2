package io.renren.modules.students.dao;

import io.renren.modules.students.entity.StudentsEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 学生信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 19:42:53
 */
@Mapper
public interface StudentsDao extends BaseMapper<StudentsEntity> {
	
}
