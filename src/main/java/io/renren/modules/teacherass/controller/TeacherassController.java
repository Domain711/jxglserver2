package io.renren.modules.teacherass.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.teacherass.entity.TeacherassEntity;
import io.renren.modules.teacherass.service.TeacherassService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 教师评价信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:32:04
 */
@RestController
@RequestMapping("teacherass/teacherass")
public class TeacherassController {
    @Autowired
    private TeacherassService teacherassService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("teacherass:teacherass:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = teacherassService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("teacherass:teacherass:info")
    public R info(@PathVariable("id") Integer id){
			TeacherassEntity teacherass = teacherassService.selectById(id);

        return R.ok().put("teacherass", teacherass);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("teacherass:teacherass:save")
    public R save(@RequestBody TeacherassEntity teacherass){
			teacherassService.insert(teacherass);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("teacherass:teacherass:update")
    public R update(@RequestBody TeacherassEntity teacherass){
			teacherassService.updateById(teacherass);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("teacherass:teacherass:delete")
    public R delete(@RequestBody Integer[] ids){
			teacherassService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
