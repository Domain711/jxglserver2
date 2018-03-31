package io.renren.modules.testplan.service.impl;

import io.renren.modules.question.entity.QuestionEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.testplan.dao.TestplanDao;
import io.renren.modules.testplan.entity.TestplanEntity;
import io.renren.modules.testplan.service.TestplanService;


@Service("testplanService")
public class TestplanServiceImpl extends ServiceImpl<TestplanDao, TestplanEntity> implements TestplanService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        List<TestplanEntity> list = baseMapper.queryTestplanListWithPage(params);
        return new PageUtils(list,list.size(),Integer.parseInt(String.valueOf(params.get("limit"))),Integer.parseInt(String.valueOf(params.get("page"))));
    }

}
