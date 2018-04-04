package io.renren.modules.tactics.service.impl;

import io.renren.modules.teachers.entity.TeachersEntity;
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
        List<TacticsEntity> list = baseMapper.queryTacticListWithPage(params);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }

}
