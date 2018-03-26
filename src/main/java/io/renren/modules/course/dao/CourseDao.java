package io.renren.modules.course.dao;

import io.renren.modules.course.entity.CourseEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 课程信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:39:19
 */
@Mapper
public interface CourseDao extends BaseMapper<CourseEntity> {
	
}
