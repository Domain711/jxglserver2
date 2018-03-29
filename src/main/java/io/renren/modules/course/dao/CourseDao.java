package io.renren.modules.course.dao;

import io.renren.modules.course.entity.CourseEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.grade.entity.GradeEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 课程信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:39:19
 */
@Mapper
public interface CourseDao extends BaseMapper<CourseEntity> {

    /**
     * 根据专业查询课程
     * @return
     */
    List<CourseEntity> queryCourseList(String majornum);
	
}
