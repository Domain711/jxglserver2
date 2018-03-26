package io.renren.modules.question.dao;

import io.renren.modules.question.entity.QuestionEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 考试成绩信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:45:25
 */
@Mapper
public interface QuestionDao extends BaseMapper<QuestionEntity> {
	
}
