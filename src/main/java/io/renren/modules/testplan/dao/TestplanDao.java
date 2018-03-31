package io.renren.modules.testplan.dao;

import io.renren.modules.question.entity.QuestionEntity;
import io.renren.modules.testplan.entity.TestplanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 考试计划信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:35:43
 */
@Mapper
public interface TestplanDao extends BaseMapper<TestplanEntity> {

    /***
     * 分页查询
     * @param param
     * @return
     */
    List<TestplanEntity> queryTestplanListWithPage(Map<String,Object> param);
}
