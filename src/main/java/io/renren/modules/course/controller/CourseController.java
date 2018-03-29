package io.renren.modules.course.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import io.renren.modules.grade.entity.GradeEntity;
import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.course.entity.CourseEntity;
import io.renren.modules.course.service.CourseService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 课程信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:39:19
 */
@RestController
@RequestMapping("course/course")
public class CourseController extends AbstractController{
    @Autowired
    private CourseService courseService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("course:course:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = courseService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 根据专业获取班级
     */
    @RequestMapping("/select")
    @RequiresPermissions("course:course:select")
    public R select(@RequestParam Map<String, Object> params){
        List<CourseEntity> courseList = courseService.queryCourseList(params);
        return R.ok().put("courseList", courseList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("course:course:info")
    public R info(@PathVariable("id") Integer id){
			CourseEntity course = courseService.selectById(id);

        return R.ok().put("course", course);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("course:course:save")
    public R save(@RequestBody CourseEntity course){
            course.setCreatetime(new Date());
            course.setCreateuser(getUser().getUsername());
			courseService.insert(course);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("course:course:update")
    public R update(@RequestBody CourseEntity course){
			courseService.updateById(course);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("course:course:delete")
    public R delete(@RequestBody Integer[] ids){
			courseService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
