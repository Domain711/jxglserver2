package io.renren.modules.tactics.controller;

import java.util.*;

import com.alibaba.druid.support.json.JSONUtils;
import com.google.gson.Gson;
import io.renren.common.utils.DateUtils;
import io.renren.modules.question.entity.QuestionEntity;
import io.renren.modules.question.service.QuestionService;
import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
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
 * @date 2018-04-04 21:11:37
 */
@RestController
@RequestMapping("tactics/tactics")
public class TacticsController extends AbstractController{
    @Autowired
    private TacticsService tacticsService;
    @Autowired
    private QuestionService questionService;

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
            tactics.setQtype("01,02,03");
            tactics.setTacname(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN_SSS)+tactics.getCoursenum());//试卷名称
            tactics.setCreateid(getUserId());
            tactics.setCreatetime(new Date());
            //to-do
        String[] qtype = tactics.getQtype().split(",");//获取题型
        Map<String,List<QuestionEntity>> resMap = new HashMap<>();
        for (String res : qtype){
            List<QuestionEntity> list = questionService.queryQuestionList(res);
            resMap.put(res,list);
        }
        tactics.setContent(new Gson().toJson(resMap));
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
