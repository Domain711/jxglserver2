package io.renren.modules.teachers.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.teachers.entity.TeachersEntity;
import io.renren.modules.teachers.service.TeachersService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 教师信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 17:44:17
 */
@RestController
@RequestMapping("teachers/teachers")
public class TeachersController {
    @Autowired
    private TeachersService teachersService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("teachers:teachers:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = teachersService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("teachers:teachers:info")
    public R info(@PathVariable("id") Integer id){
			TeachersEntity teachers = teachersService.selectById(id);

        return R.ok().put("teachers", teachers);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("teachers:teachers:save")
    public R save(@RequestBody TeachersEntity teachers){
			teachersService.insert(teachers);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("teachers:teachers:update")
    public R update(@RequestBody TeachersEntity teachers){
			teachersService.updateById(teachers);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("teachers:teachers:delete")
    public R delete(@RequestBody Integer[] ids){
			teachersService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
