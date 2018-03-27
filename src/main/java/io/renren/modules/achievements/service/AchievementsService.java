package io.renren.modules.achievements.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.achievements.entity.AchievementsEntity;

import java.util.Map;

/**
 * 科研成果表
 *
 * @author 
 * @email 
 * @date 2018-03-28 06:11:14
 */
public interface AchievementsService extends IService<AchievementsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

