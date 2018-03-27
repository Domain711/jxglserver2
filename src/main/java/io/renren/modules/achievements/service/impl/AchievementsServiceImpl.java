package io.renren.modules.achievements.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.achievements.dao.AchievementsDao;
import io.renren.modules.achievements.entity.AchievementsEntity;
import io.renren.modules.achievements.service.AchievementsService;


@Service("achievementsService")
public class AchievementsServiceImpl extends ServiceImpl<AchievementsDao, AchievementsEntity> implements AchievementsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String achievementsname = (String) params.get("achievementsname");
        Page<AchievementsEntity> page = this.selectPage(
                new Query<AchievementsEntity>(params).getPage(),
                new EntityWrapper<AchievementsEntity>().like(StringUtils.isNotBlank(achievementsname), "achievementsname", achievementsname)
        );

        return new PageUtils(page);
    }

}
