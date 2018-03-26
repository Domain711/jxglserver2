package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.ExamEntity;

import java.util.Map;

/**
 * 考试成绩信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:43:58
 */
public interface ExamService extends IService<ExamEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

