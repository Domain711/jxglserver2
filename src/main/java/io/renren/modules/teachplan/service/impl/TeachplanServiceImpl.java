package io.renren.modules.teachplan.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.teachplan.dao.TeachplanDao;
import io.renren.modules.teachplan.entity.TeachplanEntity;
import io.renren.modules.teachplan.service.TeachplanService;


@Service("teachplanService")
public class TeachplanServiceImpl extends ServiceImpl<TeachplanDao, TeachplanEntity> implements TeachplanService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TeachplanEntity> page = this.selectPage(
                new Query<TeachplanEntity>(params).getPage(),
                new EntityWrapper<TeachplanEntity>()
        );

        return new PageUtils(page);
    }

}
