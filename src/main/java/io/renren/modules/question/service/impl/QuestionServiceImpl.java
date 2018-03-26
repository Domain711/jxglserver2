package io.renren.modules.question.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.question.dao.QuestionDao;
import io.renren.modules.question.entity.QuestionEntity;
import io.renren.modules.question.service.QuestionService;


@Service("questionService")
public class QuestionServiceImpl extends ServiceImpl<QuestionDao, QuestionEntity> implements QuestionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<QuestionEntity> page = this.selectPage(
                new Query<QuestionEntity>(params).getPage(),
                new EntityWrapper<QuestionEntity>()
        );

        return new PageUtils(page);
    }

}
