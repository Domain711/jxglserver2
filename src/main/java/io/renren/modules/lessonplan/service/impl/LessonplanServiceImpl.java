package io.renren.modules.lessonplan.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.lessonplan.dao.LessonplanDao;
import io.renren.modules.lessonplan.entity.LessonplanEntity;
import io.renren.modules.lessonplan.service.LessonplanService;


@Service("lessonplanService")
public class LessonplanServiceImpl extends ServiceImpl<LessonplanDao, LessonplanEntity> implements LessonplanService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String lessonplanname =(String)params.get("lessonplanname");
        Page<LessonplanEntity> page = this.selectPage(
                new Query<LessonplanEntity>(params).getPage(),
                new EntityWrapper<LessonplanEntity>().like(StringUtils.isNotBlank(lessonplanname),"lessonplanname",lessonplanname)
        );

        return new PageUtils(page);
    }

}
