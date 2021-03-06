package io.renren.modules.question.service.impl;

import io.renren.modules.students.entity.StudentsEntity;
import org.springframework.stereotype.Service;

import java.util.List;
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
//        int pageSize = Integer.parseInt(String.valueOf(params.get("limit")));
//        int page = Integer.parseInt(String.valueOf(params.get("page")));
        List<QuestionEntity> list = baseMapper.queryQuestionListWithPage(params);
//        params.put("pageSize",pageSize);
//        params.put("page",page==1 ? page : page * pageSize);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }

    @Override
    public List<QuestionEntity> queryQuestionList(String qtype) {
        List<QuestionEntity> list = baseMapper.queryQuestionList(qtype);
        return list;
    }
}
