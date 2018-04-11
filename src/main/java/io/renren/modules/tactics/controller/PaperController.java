package io.renren.modules.tactics.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.tactics.entity.PaperEntity;
import io.renren.modules.tactics.service.PaperService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 试卷表
 *
 * @author 
 * @email 
 * @date 2018-04-11 22:24:37
 */
@RestController
@RequestMapping("tactics/paper")
public class PaperController {
    @Autowired
    private PaperService paperService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("tactics:paper:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = paperService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{tacid}")
    @RequiresPermissions("tactics:paper:info")
    public R info(@PathVariable("tacid") Long tacid){
			PaperEntity paper = paperService.selectById(tacid);

        return R.ok().put("paper", paper);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("tactics:paper:save")
    public R save(@RequestBody PaperEntity paper){
			paperService.insert(paper);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("tactics:paper:update")
    public R update(@RequestBody PaperEntity paper){
			paperService.updateById(paper);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("tactics:paper:delete")
    public R delete(@RequestBody Long[] tacids){
			paperService.deleteBatchIds(Arrays.asList(tacids));

        return R.ok();
    }

}
