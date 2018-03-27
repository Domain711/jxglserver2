package io.renren.modules.teachplan.controller;

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

import io.renren.modules.teachplan.entity.TeachplanEntity;
import io.renren.modules.teachplan.service.TeachplanService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 教案信息表
 *
 * @author 
 * @email 
 * @date 2018-03-28 05:58:16
 */
@RestController
@RequestMapping("teachplan/teachplan")
public class TeachplanController extends AbstractController{
    @Autowired
    private TeachplanService teachplanService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("teachplan:teachplan:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = teachplanService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("teachplan:teachplan:info")
    public R info(@PathVariable("id") Integer id){
			TeachplanEntity teachplan = teachplanService.selectById(id);

        return R.ok().put("teachplan", teachplan);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("teachplan:teachplan:save")
    public R save(@RequestBody TeachplanEntity teachplan){
            teachplan.setCreatetime(new Date());
            teachplan.setCreateuser(getUserId());
			teachplanService.insert(teachplan);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("teachplan:teachplan:update")
    public R update(@RequestBody TeachplanEntity teachplan){
			teachplanService.updateById(teachplan);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("teachplan:teachplan:delete")
    public R delete(@RequestBody Integer[] ids){
			teachplanService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
