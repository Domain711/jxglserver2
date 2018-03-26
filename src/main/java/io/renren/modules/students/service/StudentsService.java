package io.renren.modules.students.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.students.entity.StudentsEntity;

import java.util.Map;

/**
 * 学生信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 19:42:53
 */
public interface StudentsService extends IService<StudentsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

