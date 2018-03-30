package io.renren.modules.teachers.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.modules.teachers.dao.TeachersDao;
import io.renren.modules.teachers.entity.TeachersEntity;
import io.renren.modules.teachers.service.TeachersService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("teachersService")
public class TeachersServiceImpl extends ServiceImpl<TeachersDao, TeachersEntity> implements TeachersService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        List<TeachersEntity> list = baseMapper.queryTeacherListWithPage(params);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }

}
