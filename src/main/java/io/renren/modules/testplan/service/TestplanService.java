package io.renren.modules.testplan.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.testplan.entity.TestplanEntity;

import java.util.Map;

/**
 * 考试计划信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:35:43
 */
public interface TestplanService extends IService<TestplanEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

