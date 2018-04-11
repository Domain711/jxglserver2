package io.renren.modules.course.dao;

import io.renren.modules.course.entity.CourseEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.grade.entity.GradeEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

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
     * 分页查询
     * @param param
     * @return
     */
    List<CourseEntity> queryCourseListWithPage(Map<String,Object> param);


    /**
     * 根据专业查询课程
     * @return
     */
    List<CourseEntity> queryCourseList(@Param("majornum") String majornum);
	
}
