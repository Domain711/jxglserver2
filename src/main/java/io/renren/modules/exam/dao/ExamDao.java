package io.renren.modules.exam.dao;

import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.exam.entity.ExamEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 考试成绩信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:43:58
 */
@Mapper
public interface ExamDao extends BaseMapper<ExamEntity> {

    /**
     * 分页查询
     * @param param
     * @return
     */
    List<ExamEntity> queryExamListWithPage(Map<String,Object> param);

}
