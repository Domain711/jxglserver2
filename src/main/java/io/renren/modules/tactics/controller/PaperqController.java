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

import io.renren.modules.tactics.entity.PaperqEntity;
import io.renren.modules.tactics.service.PaperqService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 卷库
 *
 * @author 
 * @email 
 * @date 2018-04-11 23:20:27
 */
@RestController
@RequestMapping("tactics/paperq")
public class PaperqController {
    @Autowired
    private PaperqService paperqService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("tactics:paperq:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = paperqService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tactics:paperq:info")
    public R info(@PathVariable("id") Integer id){
			PaperqEntity paperq = paperqService.selectById(id);

        return R.ok().put("paperq", paperq);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("tactics:paperq:save")
    public R save(@RequestBody PaperqEntity paperq){
			paperqService.insert(paperq);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("tactics:paperq:update")
    public R update(@RequestBody PaperqEntity paperq){
			paperqService.updateById(paperq);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("tactics:paperq:delete")
    public R delete(@RequestBody Integer[] ids){
			paperqService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
