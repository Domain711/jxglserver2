package io.renren.modules.questiontype.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.questiontype.entity.QuestiontypeEntity;

import java.util.Map;

/**
 * 题目类型表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:47:24
 */
public interface QuestiontypeService extends IService<QuestiontypeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

