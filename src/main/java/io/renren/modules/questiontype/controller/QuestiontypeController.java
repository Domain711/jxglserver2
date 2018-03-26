package io.renren.modules.questiontype.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.common.utils.Constant;
import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.questiontype.entity.QuestiontypeEntity;
import io.renren.modules.questiontype.service.QuestiontypeService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 题目类型表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:47:24
 */
@RestController
@RequestMapping("questiontype/questiontype")
public class QuestiontypeController extends AbstractController {
    @Autowired
    private QuestiontypeService questiontypeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("questiontype:questiontype:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = questiontypeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("questiontype:questiontype:info")
    public R info(@PathVariable("id") Integer id){
			QuestiontypeEntity questiontype = questiontypeService.selectById(id);

        return R.ok().put("questiontype", questiontype);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("questiontype:questiontype:save")
    public R save(@RequestBody QuestiontypeEntity questiontype){
			questiontypeService.insert(questiontype);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("questiontype:questiontype:update")
    public R update(@RequestBody QuestiontypeEntity questiontype){
			questiontypeService.updateById(questiontype);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("questiontype:questiontype:delete")
    public R delete(@RequestBody Integer[] ids){
			questiontypeService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
