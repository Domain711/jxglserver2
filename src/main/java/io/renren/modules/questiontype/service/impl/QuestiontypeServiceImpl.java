package io.renren.modules.questiontype.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.questiontype.dao.QuestiontypeDao;
import io.renren.modules.questiontype.entity.QuestiontypeEntity;
import io.renren.modules.questiontype.service.QuestiontypeService;


@Service("questiontypeService")
public class QuestiontypeServiceImpl extends ServiceImpl<QuestiontypeDao, QuestiontypeEntity> implements QuestiontypeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String questiontypename = (String)params.get("questiontypename");
        Page<QuestiontypeEntity> page = this.selectPage(
                new Query<QuestiontypeEntity>(params).getPage(),
                new EntityWrapper<QuestiontypeEntity>().like(StringUtils.isNotBlank(questiontypename),"questiontypename",questiontypename)
        );

        return new PageUtils(page);
    }

    @Override
    public List<QuestiontypeEntity> queryuestiontypeList() {
        List<QuestiontypeEntity> queryuestiontypeList = baseMapper.queryuestiontypeList();
        return queryuestiontypeList;
    }
}
