package io.renren.modules.grade.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.grade.entity.GradeEntity;

import java.util.Map;

/**
 * 班级信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:42:16
 */
public interface GradeService extends IService<GradeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

