package io.renren.modules.testplan.dao;

import io.renren.modules.testplan.entity.TestplanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 考试计划信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:35:43
 */
@Mapper
public interface TestplanDao extends BaseMapper<TestplanEntity> {
	
}
