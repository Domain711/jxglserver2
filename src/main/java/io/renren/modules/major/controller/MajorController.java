package io.renren.modules.major.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import io.renren.modules.college.entity.CollegeEntity;
import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.major.entity.MajorEntity;
import io.renren.modules.major.service.MajorService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 专业信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:40:45
 */
@RestController
@RequestMapping("major/major")
public class MajorController extends AbstractController{
    @Autowired
    private MajorService majorService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("major:major:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = majorService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("major:major:info")
    public R info(@PathVariable("id") Integer id){
			MajorEntity major = majorService.selectById(id);

        return R.ok().put("major", major);
    }

    /**
     * 获取专业列表
     */
    @RequestMapping("/select")
    @RequiresPermissions("major:major:select")
    public R select(@RequestParam Map<String, Object> params){
        List<MajorEntity> majorList = majorService.queryMajorList(params);
        return R.ok().put("majorList", majorList);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("major:major:save")
    public R save(@RequestBody MajorEntity major){
            major.setCreatetime(new Date());
            major.setCreateuser(getUser().getUsername());
			majorService.insert(major);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("major:major:update")
    public R update(@RequestBody MajorEntity major){
			majorService.updateById(major);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("major:major:delete")
    public R delete(@RequestBody Integer[] ids){
			majorService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
