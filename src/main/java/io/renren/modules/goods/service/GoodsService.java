package io.renren.modules.goods.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.goods.entity.GoodsEntity;

import java.util.Map;

/**
 * 商品管理
 *
 * @author 
 * @email 
 * @date 2018-03-24 21:17:55
 */
public interface GoodsService extends IService<GoodsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

