package io.renren.modules.tactics.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.tactics.entity.PaperEntity;

import java.util.Map;

/**
 * 试卷表
 *
 * @author 
 * @email 
 * @date 2018-04-11 22:24:37
 */
public interface PaperService extends IService<PaperEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

