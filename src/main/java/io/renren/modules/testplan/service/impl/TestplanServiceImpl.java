package io.renren.modules.testplan.service.impl;

import org.springframework.stereotype.Service;
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
        Page<TestplanEntity> page = this.selectPage(
                new Query<TestplanEntity>(params).getPage(),
                new EntityWrapper<TestplanEntity>()
        );

        return new PageUtils(page);
    }

}
