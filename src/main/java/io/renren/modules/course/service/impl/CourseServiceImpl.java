package io.renren.modules.course.service.impl;

import io.renren.modules.grade.entity.GradeEntity;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.course.dao.CourseDao;
import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.course.service.CourseService;


@Service("courseService")
public class CourseServiceImpl extends ServiceImpl<CourseDao, CourseEntity> implements CourseService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        List<CourseEntity> list = baseMapper.queryCourseListWithPage(params);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }

    @Override
    public List<CourseEntity> queryCourseList(Map<String, Object> param) {
            String majornum =(String)param.get("majornum");
            List<CourseEntity> courseList = baseMapper.queryCourseList(majornum);
            return courseList;
    }
}
