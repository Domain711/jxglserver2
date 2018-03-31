package io.renren.modules.students.dao;

import io.renren.modules.students.entity.StudentsEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.teachers.entity.TeachersEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 学生信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 19:42:53
 */
@Mapper
public interface StudentsDao extends BaseMapper<StudentsEntity> {

    /***
     * 分页查询
     * @param param
     * @return
     */
    List<StudentsEntity> queryStudentsListWithPage(Map<String,Object> param);
}
