package io.renren.modules.grade.dao;

import io.renren.modules.grade.entity.GradeEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.major.entity.MajorEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 班级信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:42:16
 */
@Mapper
public interface GradeDao extends BaseMapper<GradeEntity> {

    /**
     * 根据专业查询班级
     * @return
     */
    List<GradeEntity> queryGradeList(String majornum);
}
