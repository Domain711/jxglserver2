package io.renren.modules.college.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.college.entity.CollegeEntity;

import java.util.List;
import java.util.Map;

/**
 * 学院信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:37:44
 */
public interface CollegeService extends IService<CollegeEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 获取所有学院列表
     */
    List<CollegeEntity> queryCollegeList();
}

