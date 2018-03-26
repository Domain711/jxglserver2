package io.renren.modules.teacherass.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.teacherass.dao.TeacherassDao;
import io.renren.modules.teacherass.entity.TeacherassEntity;
import io.renren.modules.teacherass.service.TeacherassService;


@Service("teacherassService")
public class TeacherassServiceImpl extends ServiceImpl<TeacherassDao, TeacherassEntity> implements TeacherassService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TeacherassEntity> page = this.selectPage(
                new Query<TeacherassEntity>(params).getPage(),
                new EntityWrapper<TeacherassEntity>()
        );

        return new PageUtils(page);
    }

}
