package io.renren.modules.teacherass.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.teacherass.entity.TeacherassEntity;

import java.util.Map;

/**
 * 教师评价信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:32:04
 */
public interface TeacherassService extends IService<TeacherassEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

