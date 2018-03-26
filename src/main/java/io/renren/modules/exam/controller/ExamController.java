package io.renren.modules.exam.controller;

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

import io.renren.modules.exam.entity.ExamEntity;
import io.renren.modules.exam.service.ExamService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 考试成绩信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:43:58
 */
@RestController
@RequestMapping("exam/exam")
public class ExamController extends AbstractController{
    @Autowired
    private ExamService examService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("exam:exam:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = examService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("exam:exam:info")
    public R info(@PathVariable("id") Integer id){
			ExamEntity exam = examService.selectById(id);

        return R.ok().put("exam", exam);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("exam:exam:save")
    public R save(@RequestBody ExamEntity exam){
            exam.setCreatetime(new Date());
			examService.insert(exam);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("exam:exam:update")
    public R update(@RequestBody ExamEntity exam){
			examService.updateById(exam);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("exam:exam:delete")
    public R delete(@RequestBody Integer[] ids){
			examService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
