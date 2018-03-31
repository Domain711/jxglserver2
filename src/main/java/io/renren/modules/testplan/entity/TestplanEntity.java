package io.renren.modules.testplan.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 考试计划信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:35:43
 */
@TableName("tb_testplan")
public class TestplanEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 学期
	 */
	private String term;
	/**
	 * 学院编号
	 */
	private String collegenum;
	private String collegename;
	/**
	 * 专业编号
	 */
	private String majornum;
	private String majorname;

	/**
	 * 班级编号
	 */
	private String gradenum;
	private String gradename;

	/**
	 * 课程编号
	 */
	private String coursenum;
	private String coursename;

	/**
	 * 考试开始时间
	 */
	private Date starttime;
	/**
	 * 考试结束时间
	 */
	private Date endtime;
	/**
	 * 考试地点
	 */
	private String addr;
	/**
	 * 计划创建时间
	 */
	private Date createtime;
	/**
	 * 计划创建人
	 */
	private String createuser;
	/**
	 * 计划备注
	 */
	private String remark;

	/**
	 * 设置：序号
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：序号
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：学期
	 */
	public void setTerm(String term) {
		this.term = term;
	}
	/**
	 * 获取：学期
	 */
	public String getTerm() {
		return term;
	}
	/**
	 * 设置：学院编号
	 */
	public void setCollegenum(String collegenum) {
		this.collegenum = collegenum;
	}
	/**
	 * 获取：学院编号
	 */
	public String getCollegenum() {
		return collegenum;
	}
	/**
	 * 设置：专业编号
	 */
	public void setMajornum(String majornum) {
		this.majornum = majornum;
	}
	/**
	 * 获取：专业编号
	 */
	public String getMajornum() {
		return majornum;
	}
	/**
	 * 设置：班级编号
	 */
	public void setGradenum(String gradenum) {
		this.gradenum = gradenum;
	}
	/**
	 * 获取：班级编号
	 */
	public String getGradenum() {
		return gradenum;
	}
	/**
	 * 设置：课程编号
	 */
	public void setCoursenum(String coursenum) {
		this.coursenum = coursenum;
	}
	/**
	 * 获取：课程编号
	 */
	public String getCoursenum() {
		return coursenum;
	}
	/**
	 * 设置：考试开始时间
	 */
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	/**
	 * 获取：考试开始时间
	 */
	public Date getStarttime() {
		return starttime;
	}
	/**
	 * 设置：考试结束时间
	 */
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	/**
	 * 获取：考试结束时间
	 */
	public Date getEndtime() {
		return endtime;
	}
	/**
	 * 设置：考试地点
	 */
	public void setAddr(String addr) {
		this.addr = addr;
	}
	/**
	 * 获取：考试地点
	 */
	public String getAddr() {
		return addr;
	}
	/**
	 * 设置：计划创建时间
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：计划创建时间
	 */
	public Date getCreatetime() {
		return createtime;
	}
	/**
	 * 设置：计划创建人
	 */
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	/**
	 * 获取：计划创建人
	 */
	public String getCreateuser() {
		return createuser;
	}
	/**
	 * 设置：计划备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：计划备注
	 */
	public String getRemark() {
		return remark;
	}

	public String getCollegename() {
		return collegename;
	}

	public void setCollegename(String collegename) {
		this.collegename = collegename;
	}

	public String getMajorname() {
		return majorname;
	}

	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
}
