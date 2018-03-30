package io.renren.modules.major.service.impl;

import io.renren.modules.college.entity.CollegeEntity;
import io.renren.modules.course.entity.CourseEntity;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.major.dao.MajorDao;
import io.renren.modules.major.entity.MajorEntity;
import io.renren.modules.major.service.MajorService;


@Service("majorService")
public class MajorServiceImpl extends ServiceImpl<MajorDao, MajorEntity> implements MajorService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        List<MajorEntity> list = baseMapper.queryMajorListWithPage(params);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }


    @Override
    public List<MajorEntity> queryMajorList(Map<String, Object> param) {
        String collegenum =(String)param.get("collegenum");
        List<MajorEntity> majorList = baseMapper.queryMajorList(collegenum);
        return majorList;
    }
}
