package io.renren.modules.lessonplan.dao;

import io.renren.modules.lessonplan.entity.LessonplanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 教案信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-28 06:06:43
 */
@Mapper
public interface LessonplanDao extends BaseMapper<LessonplanEntity> {
	
}
