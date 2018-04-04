package io.renren.modules.question.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.major.entity.MajorEntity;
import io.renren.modules.question.entity.QuestionEntity;

import java.util.List;
import java.util.Map;

/**
 * 考试成绩信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:45:25
 */
public interface QuestionService extends IService<QuestionEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 获取相关题目
     * @param
     */
    List<QuestionEntity> queryQuestionList(String qtype);
}

