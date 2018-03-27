package io.renren.modules.teachplan.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.teachplan.entity.TeachplanEntity;

import java.util.Map;

/**
 * 教案信息表
 *
 * @author 
 * @email 
 * @date 2018-03-28 05:58:16
 */
public interface TeachplanService extends IService<TeachplanEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

