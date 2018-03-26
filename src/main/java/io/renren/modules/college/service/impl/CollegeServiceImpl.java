package io.renren.modules.college.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.college.dao.CollegeDao;
import io.renren.modules.college.entity.CollegeEntity;
import io.renren.modules.college.service.CollegeService;


@Service("collegeService")
public class CollegeServiceImpl extends ServiceImpl<CollegeDao, CollegeEntity> implements CollegeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String  collegename = (String)params.get("collegename");
        Page<CollegeEntity> page = this.selectPage(
                new Query<CollegeEntity>(params).getPage(),
                new EntityWrapper<CollegeEntity>().like(StringUtils.isNotBlank(collegename),"collegename",collegename)
        );

        return new PageUtils(page);
    }

}
