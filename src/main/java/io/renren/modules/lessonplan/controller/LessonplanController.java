package io.renren.modules.lessonplan.controller;

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

import io.renren.modules.lessonplan.entity.LessonplanEntity;
import io.renren.modules.lessonplan.service.LessonplanService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 教案信息表
 *
 * @author 
 * @email 
 * @date 2018-03-28 06:06:43
 */
@RestController
@RequestMapping("lessonplan/lessonplan")
public class LessonplanController extends AbstractController{
    @Autowired
    private LessonplanService lessonplanService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("lessonplan:lessonplan:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = lessonplanService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("lessonplan:lessonplan:info")
    public R info(@PathVariable("id") Integer id){
			LessonplanEntity lessonplan = lessonplanService.selectById(id);

        return R.ok().put("lessonplan", lessonplan);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("lessonplan:lessonplan:save")
    public R save(@RequestBody LessonplanEntity lessonplan){
            lessonplan.setCreatetime(new Date());
            lessonplan.setCreateuser(getUserId());
			lessonplanService.insert(lessonplan);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("lessonplan:lessonplan:update")
    public R update(@RequestBody LessonplanEntity lessonplan){
			lessonplanService.updateById(lessonplan);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("lessonplan:lessonplan:delete")
    public R delete(@RequestBody Integer[] ids){
			lessonplanService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
