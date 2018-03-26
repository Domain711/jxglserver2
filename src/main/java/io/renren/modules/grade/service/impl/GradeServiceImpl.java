package io.renren.modules.grade.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.grade.dao.GradeDao;
import io.renren.modules.grade.entity.GradeEntity;
import io.renren.modules.grade.service.GradeService;


@Service("gradeService")
public class GradeServiceImpl extends ServiceImpl<GradeDao, GradeEntity> implements GradeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String gradename = (String)params.get("gradename");
        Page<GradeEntity> page = this.selectPage(
                new Query<GradeEntity>(params).getPage(),
                new EntityWrapper<GradeEntity>().like(StringUtils.isNotBlank(gradename),"gradename",gradename)
        );

        return new PageUtils(page);
    }

}
