package io.renren.modules.major.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.major.entity.MajorEntity;

import java.util.Map;

/**
 * 专业信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:40:45
 */
public interface MajorService extends IService<MajorEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

