package io.renren.modules.tactics.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.common.utils.DateUtils;
import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.tactics.entity.TacticsEntity;
import io.renren.modules.tactics.service.TacticsService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 组卷策略
 *
 * @author 
 * @email 
 * @date 2018-04-02 12:22:28
 */
@RestController
@RequestMapping("tactics/tactics")
public class TacticsController extends AbstractController {
    @Autowired
    private TacticsService tacticsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("tactics:tactics:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = tacticsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 生成试卷
     */
    @RequestMapping("/paper")
    @RequiresPermissions("tactics:tactics:paper")
    public R paper(@RequestParam Map<String, Object> params){
        PageUtils page = tacticsService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{tacid}")
    @RequiresPermissions("tactics:tactics:info")
    public R info(@PathVariable("tacid") Long tacid){
			TacticsEntity tactics = tacticsService.selectById(tacid);

        return R.ok().put("tactics", tactics);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("tactics:tactics:save")
    public R save(@RequestBody TacticsEntity tactics){
            tactics.setTacname(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN)+tactics.getCoursenum());//试卷名称
            tactics.setCreateid(getUserId());
            tactics.setCreatetime(new Date());
            //to-do 根据条件组装策生成试卷

			tacticsService.insert(tactics);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("tactics:tactics:update")
    public R update(@RequestBody TacticsEntity tactics){
			tacticsService.updateById(tactics);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("tactics:tactics:delete")
    public R delete(@RequestBody Long[] tacids){
			tacticsService.deleteBatchIds(Arrays.asList(tacids));

        return R.ok();
    }

}
