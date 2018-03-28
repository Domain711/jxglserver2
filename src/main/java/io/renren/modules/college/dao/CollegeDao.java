package io.renren.modules.college.dao;

import io.renren.modules.college.entity.CollegeEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 学院信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:37:44
 */
@Mapper
public interface CollegeDao extends BaseMapper<CollegeEntity> {
    /**
     * 获取所有学院信息
     * @return
     */
    List<CollegeEntity> queryCollegeList();
}
