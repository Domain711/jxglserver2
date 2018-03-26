package io.renren.modules.college.controller;

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

import io.renren.modules.college.entity.CollegeEntity;
import io.renren.modules.college.service.CollegeService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 学院信息表
 *
 * @author 
 * @email 
 * @date 2018-03-25 18:37:44
 */
@RestController
@RequestMapping("college/college")
public class CollegeController extends AbstractController{
    @Autowired
    private CollegeService collegeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("college:college:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = collegeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("college:college:info")
    public R info(@PathVariable("id") Integer id){
			CollegeEntity college = collegeService.selectById(id);

        return R.ok().put("college", college);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("college:college:save")
    public R save(@RequestBody CollegeEntity college){
            college.setCreatetime(new Date());
            college.setCreateuser(String.valueOf(getUser().getUsername()));
			collegeService.insert(college);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("college:college:update")
    public R update(@RequestBody CollegeEntity college){
			collegeService.updateById(college);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("college:college:delete")
    public R delete(@RequestBody Integer[] ids){
			collegeService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
