package io.renren.modules.questiontype.dao;

import io.renren.modules.questiontype.entity.QuestiontypeEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 题目类型表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:47:24
 */
@Mapper
public interface QuestiontypeDao extends BaseMapper<QuestiontypeEntity> {

    /**
     * 获取所有题型列表
     * @return
     */
    List<QuestiontypeEntity> queryuestiontypeList();
}
