package io.renren.modules.achievements.controller;

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

import io.renren.modules.achievements.entity.AchievementsEntity;
import io.renren.modules.achievements.service.AchievementsService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 科研成果表
 *
 * @author 
 * @email 
 * @date 2018-03-28 06:11:14
 */
@RestController
@RequestMapping("achievements/achievements")
public class AchievementsController extends AbstractController{
    @Autowired
    private AchievementsService achievementsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("achievements:achievements:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = achievementsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("achievements:achievements:info")
    public R info(@PathVariable("id") Integer id){
			AchievementsEntity achievements = achievementsService.selectById(id);

        return R.ok().put("achievements", achievements);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("achievements:achievements:save")
    public R save(@RequestBody AchievementsEntity achievements){
            achievements.setCreatetime(new Date());
            achievements.setCreateuser(getUserId());
			achievementsService.insert(achievements);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("achievements:achievements:update")
    public R update(@RequestBody AchievementsEntity achievements){
			achievementsService.updateById(achievements);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("achievements:achievements:delete")
    public R delete(@RequestBody Integer[] ids){
			achievementsService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
