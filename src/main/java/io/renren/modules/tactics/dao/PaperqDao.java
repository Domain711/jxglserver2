package io.renren.modules.tactics.dao;

import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.tactics.entity.PaperqEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 卷库
 * 
 * @author 
 * @email 
 * @date 2018-04-11 23:20:27
 */
@Mapper
public interface PaperqDao extends BaseMapper<PaperqEntity> {


    List<PaperqEntity> queryPaperqList(String majornum);
}
