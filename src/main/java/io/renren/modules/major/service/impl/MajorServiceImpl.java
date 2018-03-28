package io.renren.modules.major.service.impl;

import io.renren.modules.college.entity.CollegeEntity;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.major.dao.MajorDao;
import io.renren.modules.major.entity.MajorEntity;
import io.renren.modules.major.service.MajorService;


@Service("majorService")
public class MajorServiceImpl extends ServiceImpl<MajorDao, MajorEntity> implements MajorService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String majorname = (String)params.get("majorname");
        Page<MajorEntity> page = this.selectPage(
                new Query<MajorEntity>(params).getPage(),
                new EntityWrapper<MajorEntity>().like(StringUtils.isNotBlank(majorname),"majorname",majorname)
        );

        return new PageUtils(page);
    }


}
