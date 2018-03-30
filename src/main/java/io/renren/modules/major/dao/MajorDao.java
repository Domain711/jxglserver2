package io.renren.modules.major.dao;

import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.major.entity.MajorEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 专业信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:40:45
 */
@Mapper
public interface MajorDao extends BaseMapper<MajorEntity> {

    /**分页查询
     * @param param
     * @return
      */
    List<MajorEntity> queryMajorListWithPage(Map<String,Object> param);

    /**
     * 根据学院查询专业
     * @return
     */
    List<MajorEntity> queryMajorList(String collegenum);
	
}
