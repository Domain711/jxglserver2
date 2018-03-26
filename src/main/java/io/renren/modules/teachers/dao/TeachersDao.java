package io.renren.modules.teachers.dao;

import io.renren.modules.teachers.entity.TeachersEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 教师信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 17:44:17
 */
@Mapper
public interface TeachersDao extends BaseMapper<TeachersEntity> {
	
}
