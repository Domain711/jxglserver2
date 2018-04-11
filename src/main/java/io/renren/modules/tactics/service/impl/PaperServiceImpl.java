package io.renren.modules.tactics.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.tactics.dao.PaperDao;
import io.renren.modules.tactics.entity.PaperEntity;
import io.renren.modules.tactics.service.PaperService;


@Service("paperService")
public class PaperServiceImpl extends ServiceImpl<PaperDao, PaperEntity> implements PaperService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<PaperEntity> page = this.selectPage(
                new Query<PaperEntity>(params).getPage(),
                new EntityWrapper<PaperEntity>()
        );

        return new PageUtils(page);
    }

}
