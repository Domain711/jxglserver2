package io.renren.modules.teachers.service.impl;

import io.renren.modules.app.entity.UserEntity;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
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
        String num = (String)params.get("num");
        List<Long> roleIdList = (List)params.get("roleIdList");

        Page<TeachersEntity> page = this.selectPage(
                new Query<TeachersEntity>(params).getPage(),
                new EntityWrapper<TeachersEntity>().eq(StringUtils.isNotBlank(num),"num",num)
        );

        return new PageUtils(page);
    }

}
