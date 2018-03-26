package io.renren.modules.course.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.course.entity.CourseEntity;

import java.util.Map;

/**
 * 课程信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:39:19
 */
public interface CourseService extends IService<CourseEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

