package io.renren.modules.grade.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.college.entity.CollegeEntity;
import io.renren.modules.grade.entity.GradeEntity;
import io.renren.modules.major.entity.MajorEntity;

import java.util.List;
import java.util.Map;

/**
 * 班级信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:42:16
 */
public interface GradeService extends IService<GradeEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 根据专业获取班级列表
     * @param
     */
    List<GradeEntity> queryGradeList(Map<String,Object> param);



}

