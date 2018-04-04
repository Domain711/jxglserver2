package io.renren.modules.tactics.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.tactics.entity.TacticsEntity;

import java.util.Map;

/**
 * 组卷策略
 *
 * @author 
 * @email 
 * @date 2018-04-04 21:11:37
 */
public interface TacticsService extends IService<TacticsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

