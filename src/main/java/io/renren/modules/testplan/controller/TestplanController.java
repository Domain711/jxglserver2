package io.renren.modules.testplan.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.testplan.entity.TestplanEntity;
import io.renren.modules.testplan.service.TestplanService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 考试计划信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:35:43
 */
@RestController
@RequestMapping("testplan/testplan")
public class TestplanController {
    @Autowired
    private TestplanService testplanService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("testplan:testplan:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = testplanService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("testplan:testplan:info")
    public R info(@PathVariable("id") Integer id){
			TestplanEntity testplan = testplanService.selectById(id);

        return R.ok().put("testplan", testplan);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("testplan:testplan:save")
    public R save(@RequestBody TestplanEntity testplan){
			testplanService.insert(testplan);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("testplan:testplan:update")
    public R update(@RequestBody TestplanEntity testplan){
			testplanService.updateById(testplan);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("testplan:testplan:delete")
    public R delete(@RequestBody Integer[] ids){
			testplanService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
