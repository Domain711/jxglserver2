package io.renren.modules.grade.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.grade.dao.GradeDao;
import io.renren.modules.grade.entity.GradeEntity;
import io.renren.modules.grade.service.GradeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("gradeService")
public class GradeServiceImpl extends ServiceImpl<GradeDao, GradeEntity> implements GradeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        List<GradeEntity> list = baseMapper.queryGradeListWithPage(params);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }

    @Override
    public List<GradeEntity> queryGradeList(Map<String, Object> param) {
        String majornum =(String)param.get("majornum");
        List<GradeEntity> gradeList = baseMapper.queryGradeList(majornum);
        return gradeList;
    }
}
