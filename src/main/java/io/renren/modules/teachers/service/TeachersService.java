package io.renren.modules.teachers.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.teachers.entity.TeachersEntity;

import java.util.Map;

/**
 * 教师信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 17:44:17
 */
public interface TeachersService extends IService<TeachersEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

