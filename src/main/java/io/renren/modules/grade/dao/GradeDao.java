package io.renren.modules.grade.dao;

import io.renren.modules.grade.entity.GradeEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 班级信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:42:16
 */
@Mapper
public interface GradeDao extends BaseMapper<GradeEntity> {
	
}
