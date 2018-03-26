package io.renren.modules.teachers.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.teachers.dao.TeachersDao;
import io.renren.modules.teachers.entity.TeachersEntity;
import io.renren.modules.teachers.service.TeachersService;


@Service("teachersService")
public class TeachersServiceImpl extends ServiceImpl<TeachersDao, TeachersEntity> implements TeachersService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<TeachersEntity> page = this.selectPage(
                new Query<TeachersEntity>(params).getPage(),
                new EntityWrapper<TeachersEntity>()
        );

        return new PageUtils(page);
    }

}
