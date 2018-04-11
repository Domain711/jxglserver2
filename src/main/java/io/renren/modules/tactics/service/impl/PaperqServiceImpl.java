package io.renren.modules.tactics.service.impl;

import io.renren.modules.course.entity.CourseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.tactics.dao.PaperqDao;
import io.renren.modules.tactics.entity.PaperqEntity;
import io.renren.modules.tactics.service.PaperqService;


@Service("paperqService")
public class PaperqServiceImpl extends ServiceImpl<PaperqDao, PaperqEntity> implements PaperqService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<PaperqEntity> page = this.selectPage(
                new Query<PaperqEntity>(params).getPage(),
                new EntityWrapper<PaperqEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<PaperqEntity> queryPaperqList(Map<String, Object> param) {
        String majornum =(String)param.get("majornum");
        List<PaperqEntity> courseList = baseMapper.queryPaperqList(majornum);
        return courseList;
    }
}
