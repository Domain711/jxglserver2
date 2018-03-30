package io.renren.modules.teachers.dao;

import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.teachers.entity.TeachersEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 教师信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 17:44:17
 */
@Mapper
public interface TeachersDao extends BaseMapper<TeachersEntity> {

      /***
       * 分页查询
     * @param param
     * @return
      */
    List<TeachersEntity> queryTeacherListWithPage(Map<String,Object> param);
	
}
