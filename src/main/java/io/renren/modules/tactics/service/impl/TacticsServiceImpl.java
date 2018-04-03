package io.renren.modules.tactics.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.tactics.dao.TacticsDao;
import io.renren.modules.tactics.entity.TacticsEntity;
import io.renren.modules.tactics.service.TacticsService;


@Service("tacticsService")
public class TacticsServiceImpl extends ServiceImpl<TacticsDao, TacticsEntity> implements TacticsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TacticsEntity> page = this.selectPage(
                new Query<TacticsEntity>(params).getPage(),
                new EntityWrapper<TacticsEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List createPaper(Map<String, Object> params) {
        return null;
    }
}
