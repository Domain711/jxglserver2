package io.renren.modules.question.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.question.entity.QuestionEntity;
import io.renren.modules.question.service.QuestionService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 考试成绩信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:45:25
 */
@RestController
@RequestMapping("question/question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("question:question:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = questionService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("question:question:info")
    public R info(@PathVariable("id") Integer id){
			QuestionEntity question = questionService.selectById(id);

        return R.ok().put("question", question);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("question:question:save")
    public R save(@RequestBody QuestionEntity question){
			questionService.insert(question);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("question:question:update")
    public R update(@RequestBody QuestionEntity question){
			questionService.updateById(question);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("question:question:delete")
    public R delete(@RequestBody Integer[] ids){
			questionService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
