package io.renren.modules.tactics.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.tactics.entity.PaperqEntity;

import java.util.List;
import java.util.Map;

/**
 * 卷库
 *
 * @author 
 * @email 
 * @date 2018-04-11 23:20:27
 */
public interface PaperqService extends IService<PaperqEntity> {

    PageUtils queryPage(Map<String, Object> params);


    List<PaperqEntity> queryPaperqList(Map<String,Object> param);
}

