package io.renren.modules.tactics.dao;

import io.renren.modules.tactics.entity.TacticsEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import io.renren.modules.teachers.entity.TeachersEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 组卷策略
 * 
 * @author 
 * @email 
 * @date 2018-04-04 21:11:37
 */
@Mapper
public interface TacticsDao extends BaseMapper<TacticsEntity> {
    /***
     * 分页查询
     * @param param
     * @return
     */
    List<TacticsEntity> queryTacticListWithPage(Map<String,Object> param);
}
