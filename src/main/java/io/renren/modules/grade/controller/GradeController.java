package io.renren.modules.grade.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.grade.entity.GradeEntity;
import io.renren.modules.grade.service.GradeService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 班级信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:42:16
 */
@RestController
@RequestMapping("grade/grade")
public class GradeController extends AbstractController{
    @Autowired
    private GradeService gradeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("grade:grade:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = gradeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("grade:grade:info")
    public R info(@PathVariable("id") Integer id){
			GradeEntity grade = gradeService.selectById(id);

        return R.ok().put("grade", grade);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("grade:grade:save")
    public R save(@RequestBody GradeEntity grade){
            grade.setCreateuser(getUser().getUsername());
            grade.setCreatetime(new Date());
			gradeService.insert(grade);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("grade:grade:update")
    public R update(@RequestBody GradeEntity grade){
			gradeService.updateById(grade);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("grade:grade:delete")
    public R delete(@RequestBody Integer[] ids){
			gradeService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
