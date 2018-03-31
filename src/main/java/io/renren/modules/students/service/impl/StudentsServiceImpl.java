package io.renren.modules.students.service.impl;

import io.renren.modules.teachers.entity.TeachersEntity;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.students.dao.StudentsDao;
import io.renren.modules.students.entity.StudentsEntity;
import io.renren.modules.students.service.StudentsService;


@Service("studentsService")
public class StudentsServiceImpl extends ServiceImpl<StudentsDao, StudentsEntity> implements StudentsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        List<StudentsEntity> list = baseMapper.queryStudentsListWithPage(params);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }


}
