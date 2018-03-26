package io.renren.modules.exam.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.ExamDao;
import io.renren.modules.exam.entity.ExamEntity;
import io.renren.modules.exam.service.ExamService;


@Service("examService")
public class ExamServiceImpl extends ServiceImpl<ExamDao, ExamEntity> implements ExamService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String studentnum = (String)params.get("studentnum");
        Page<ExamEntity> page = this.selectPage(
                new Query<ExamEntity>(params).getPage(),
                new EntityWrapper<ExamEntity>().like(StringUtils.isNotBlank(studentnum),"studentnum",studentnum)
        );

        return new PageUtils(page);
    }

}
