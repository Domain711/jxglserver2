package io.renren.modules.question.dao;

import io.renren.modules.question.entity.QuestionEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.students.entity.StudentsEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 考试成绩信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:45:25
 */
@Mapper
public interface QuestionDao extends BaseMapper<QuestionEntity> {

    /***
     * 分页查询
     * @param param
     * @return
     */
    List<QuestionEntity> queryQuestionListWithPage(Map<String,Object> param);

    /**
     * 根据题型查询相关题目
     * @param qtype
     * @return
     */
    List<QuestionEntity> queryQuestionList(String qtype);
}
