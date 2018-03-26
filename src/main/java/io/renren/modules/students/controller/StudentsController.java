package io.renren.modules.students.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.students.entity.StudentsEntity;
import io.renren.modules.students.service.StudentsService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 学生信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 19:42:53
 */
@RestController
@RequestMapping("students/students")
public class StudentsController {
    @Autowired
    private StudentsService studentsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("students:students:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = studentsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("students:students:info")
    public R info(@PathVariable("id") Integer id){
			StudentsEntity students = studentsService.selectById(id);

        return R.ok().put("students", students);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("students:students:save")
    public R save(@RequestBody StudentsEntity students){
			studentsService.insert(students);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("students:students:update")
    public R update(@RequestBody StudentsEntity students){
			studentsService.updateById(students);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("students:students:delete")
    public R delete(@RequestBody Integer[] ids){
			studentsService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
