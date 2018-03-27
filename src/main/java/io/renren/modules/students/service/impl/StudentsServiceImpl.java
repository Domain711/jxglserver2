package io.renren.modules.students.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
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
        String studentnum = (String)params.get("studentnum");
        Page<StudentsEntity> page = this.selectPage(
                new Query<StudentsEntity>(params).getPage(),
                new EntityWrapper<StudentsEntity>().eq(StringUtils.isNotBlank(studentnum),"studentnum",studentnum)
        );

        return new PageUtils(page);
    }

}
