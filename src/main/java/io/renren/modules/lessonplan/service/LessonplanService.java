package io.renren.modules.lessonplan.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.lessonplan.entity.LessonplanEntity;

import java.util.Map;

/**
 * 教案信息表
 *
 * @author 
 * @email 
 * @date 2018-03-28 06:06:43
 */
public interface LessonplanService extends IService<LessonplanEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

